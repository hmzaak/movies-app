import 'package:movies/app/app.locator.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class WatchViewModel extends ReactiveViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();

  /// Getters
  List get allMovies => _repositoryService.allMovies;
  bool get fetchingMovies => _repositoryService.fetchingMovies;

  @override
  List<ListenableServiceMixin> get listenableServices => [_repositoryService];
}
