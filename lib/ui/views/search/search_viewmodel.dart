import 'package:movies/app/app.locator.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends ReactiveViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();

  List<Movie> get searchedMovies => _repositoryService.searchedMovies;
  bool get isSearchLoading => _repositoryService.isSearchLoading;

  @override
  List<ListenableServiceMixin> get listenableServices => [_repositoryService];
}
