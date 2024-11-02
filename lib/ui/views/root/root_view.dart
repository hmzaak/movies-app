import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'root_viewmodel.dart';

class RootView extends StackedView<RootViewModel> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RootViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  RootViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RootViewModel();
}
