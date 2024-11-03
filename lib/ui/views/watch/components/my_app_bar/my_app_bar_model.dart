import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class MyAppBarModel extends ReactiveViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();

  //Variables
  Timer? _timer;

  //Getters
  bool get showSearchBar => _repositoryService.showSearchBar;

  //Setters
  set showSearchBar(bool value) {
    _repositoryService.showSearchBar = value;
  }

  //Controllers
  TextEditingController searchController = TextEditingController();

  //Methods
  void searchWithDelay(String query, {int delayInSeconds = 1}) {
    _timer?.cancel();
    if (query.isNotEmpty) {
      _repositoryService.isTyping = true;
      _timer = Timer.periodic(Duration(seconds: delayInSeconds), (timer) {
        _repositoryService.searchMovies(query);
        _timer?.cancel();
      });
    } else {
      onTypingStop();
    }
  }

  onTypingStop() {
    _repositoryService.isTyping = false;
    searchController.clear();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_repositoryService];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
