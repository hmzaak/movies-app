import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();
  final logger = getLogger('MovieDetailsViewModel');

  /// Variables
  String? videoId;
  List<String>? images;
  bool _imagesLoading = false;
  bool _loadingMovieDetails = false;
  bool _isTrailerLoading = false;

  /// Getters
  bool get imagesLoading => _imagesLoading;
  bool get loadingMovieDetails => _loadingMovieDetails;
  bool get isTrailerLoading => _isTrailerLoading;

  /// Setters
  set imagesLoading(bool value) {
    _imagesLoading = value;
    notifyListeners();
  }

  set isTrailerLoading(bool value) {
    _isTrailerLoading = value;
    notifyListeners();
  }

  set loadingMovieDetails(bool value) {
    _loadingMovieDetails = value;
    notifyListeners();
  }

  getMovieImages(int movieId) async {
    imagesLoading = true;
    images = await _repositoryService.getMovieImages(movieId);
    imagesLoading = false;
  }

  getMovieTrailer(int movieId) async {
    isTrailerLoading = true;
    notifyListeners();

    videoId = await _repositoryService.getMovieTrailer(movieId);
    logger.i('Trailer Url: $videoId');

    isTrailerLoading = false;
    notifyListeners();
  }
}
