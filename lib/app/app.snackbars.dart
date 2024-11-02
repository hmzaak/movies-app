import 'package:flutter/material.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType {
  defaultBar,
  error,
  success,
}

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  ));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.defaultBar,
    config: SnackbarConfig(
      backgroundColor: AppColors.kBlackColor,
      textColor: AppColors.kWhiteColor,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: AppColors.kErrorColor,
      textColor: AppColors.kWhiteColor,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: AppColors.kSuccessColor,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );
}
