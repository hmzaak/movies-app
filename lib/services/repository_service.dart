import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/app/app.snackbars.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/ui/common/api_endpoints.dart';
import 'package:movies/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RepositoryService with ListenableServiceMixin {
  RepositoryService() {
    fetchUpcomingMoviesPage(1);

    listenToReactiveValues([
      fetchingMovies,
      _showSearchBar,
      _isTyping,
      _searchedMovies,
      _isSearchLoading
    ]);
  }

  /// Services
  final ApiService _apiService = locator<ApiService>();
  final _logger = getLogger("RepositoryService");
  final _snackbarService = locator<SnackbarService>();

  /// Variables
  List<Movie> _allMovies = [];
  bool _fetchingMovies = false;
  bool _showSearchBar = false;
  bool _isTyping = false;
  List<Movie> _searchedMovies = [];
  bool _isSearchLoading = false;

  /// Getters
  bool get showSearchBar => _showSearchBar;
  bool get isTyping => _isTyping;
  bool get fetchingMovies => _fetchingMovies;
  List<Movie> get searchedMovies => _searchedMovies;
  bool get isSearchLoading => _isSearchLoading;
  List<Movie> get allMovies => _allMovies;

  /// Setters
  set showSearchBar(bool value) {
    _showSearchBar = value;
    notifyListeners();
  }

  set fetchingMovies(bool value) {
    _fetchingMovies = value;
    notifyListeners();
  }

  set allMovies(List<Movie> movies) {
    _allMovies = movies;
    notifyListeners();
  }

  set searchedMovies(List<Movie> movies) {
    _searchedMovies = movies;
    notifyListeners();
  }

  set isTyping(bool value) {
    _isTyping = value;
    notifyListeners();
  }

  set isSearchLoading(bool value) {
    _isSearchLoading = value;
    notifyListeners();
  }

  /// Methods
  fetchUpcomingMoviesPage(int page) async {
    fetchingMovies = true;
    notifyListeners();

    final response = await _apiService
        .get(endPoint: ApiEndPoints.upcomingMovies, params: {"page": page});
    if (response != null) {
      List<Movie> movies = [];
      response.data['results'].forEach((movie) {
        movies.add(Movie.fromMap(movie));
      });
      allMovies = movies;
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movies",
        variant: SnackbarType.error,
      );
    }

    fetchingMovies = false;
    notifyListeners();
  }

  Future<List<String>?> getMovieImages(int movieId) async {
    List<String> images = [];
    final response = await _apiService.get(endPoint: "movie/$movieId/images");
    if (response != null) {
      if (response.data['backdrops'].length > 0) {
        response.data['backdrops'].forEach((backdrop) {
          images.add(imagesBaseUrl + backdrop['file_path']);
        });
        return images;
      } else {
        _snackbarService.showCustomSnackBar(
          message: "No Images found",
          variant: SnackbarType.error,
        );
        return [];
      }
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movie trailer",
        variant: SnackbarType.error,
      );
      return null;
    }
  }

  Future<String?> getMovieTrailer(int movieId) async {
    final response = await _apiService.get(
      endPoint: "movie/$movieId/videos",
    );
    if (response != null) {
      if (response.data['results'].length > 0) {
        var trailerKey = response.data['results'][0]['key'];
        return trailerKey;
      } else {
        _snackbarService.showCustomSnackBar(
          message: "No trailer found",
          variant: SnackbarType.error,
        );
        return null;
      }
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movie trailer",
        variant: SnackbarType.error,
      );
      return null;
    }
  }

  searchMovies(String query) {
    isSearchLoading = true;
    _fetchSearchedMoviesPage(1, query);
  }

  _fetchSearchedMoviesPage(int page, String query) async {
    final response = await _apiService.get(
        endPoint: ApiEndPoints.search,
        params: {"page": page, "query": query, "language": "en-US"});
    if (response != null) {
      List<Movie> newMovies = [];
      response.data['results'].forEach((movie) {
        newMovies.add(Movie.fromMap(movie));
      });
      searchedMovies = newMovies;
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movies",
        variant: SnackbarType.error,
      );
    }
    isSearchLoading = false;
  }
}
