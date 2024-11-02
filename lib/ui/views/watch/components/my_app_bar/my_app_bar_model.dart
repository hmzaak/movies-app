import 'package:stacked/stacked.dart';

class MyAppBarModel extends BaseViewModel {
  bool _showSearchBar = false;

  //Getters
  bool get showSearchBar => _showSearchBar;

  //Setters
  set showSearchBar(bool value) {
    _showSearchBar = value;
    notifyListeners();
  }
}
