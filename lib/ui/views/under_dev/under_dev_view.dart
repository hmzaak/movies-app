import 'package:flutter/material.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

import 'under_dev_viewmodel.dart';

class UnderDevView extends StackedView<UnderDevViewModel> {
  const UnderDevView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UnderDevViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.kBackgoundColor,
      body: Center(
        child: LottieBuilder.asset(
          'assets/under_construction.json',
        ),
      ),
    );
  }

  @override
  UnderDevViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UnderDevViewModel();
}
