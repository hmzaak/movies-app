import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/ui/common/api_endpoints.dart';
import 'package:stacked/stacked.dart';

class RepositoryService with ListenableServiceMixin {
  RepositoryService() {
    fetchUpcomingMoviesPage(1);

    listenToReactiveValues([
      fetchingMovies,
    ]);
  }

  /// Services
  final ApiService _apiService = locator<ApiService>();
  final _logger = getLogger("RepositoryService");

  /// Variables
  List<Movie> allMovies = [];
  bool fetchingMovies = false;

  //Methods
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
    }

    fetchingMovies = false;
    notifyListeners();
  }
}
