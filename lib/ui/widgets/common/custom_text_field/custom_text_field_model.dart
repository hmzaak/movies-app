import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomTextFieldModel extends BaseViewModel {
  CustomTextFieldModel() {
    _myFocusNode = FocusNode();
    _myFocusNode.addListener(() {
      _onFocusChange();
    });
  }
  late FocusNode _myFocusNode;
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier<bool>(false);
  bool _showErrorMessage = false;
  //Getters
  ValueNotifier<bool> get myFocusNotifier => _myFocusNotifier;
  FocusNode get myFocusNode => _myFocusNode;
  bool get showErrorMessage => _showErrorMessage;
  //Setters
  set showErrorMessage(bool value) {
    _showErrorMessage = value;
    notifyListeners();
  }

  void _onFocusChange() {
    _myFocusNotifier.value = _myFocusNode.hasFocus;
  }

  @override
  void dispose() {
    _myFocusNode.removeListener(_onFocusChange);
    _myFocusNode.dispose();
    _myFocusNotifier.dispose();
    super.dispose();
  }
}
