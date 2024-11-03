import 'package:flutter/material.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class WatchViewModel extends ReactiveViewModel {
  /// Services
  final RepositoryService _repositoryService = locator<RepositoryService>();
  final log = getLogger("WatchViewModel");

  /// Controllers
  ScrollController scrollController = ScrollController();

  /// Getters
  List get allMovies => _repositoryService.allMovies;
  bool get fetchingMovies => _repositoryService.fetchingMovies;
  bool get fetchingMoreMovies => _repositoryService.fetchingMoreMovies;
  bool get showSearchBar => _repositoryService.showSearchBar;
  bool get isTyping => _repositoryService.isTyping;
  bool get isLastPage => _repositoryService.isLastPage;

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Load more data when the user reaches the end of the list
      // _repositoryService.fetchUpcomingMoviesPage();
      if (!isLastPage) {
        _repositoryService.fetchMoreMovies();
      } else {
        log.w("No more pages to load");
      }
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_repositoryService];
}
