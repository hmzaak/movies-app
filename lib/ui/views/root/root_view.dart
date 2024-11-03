import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_icons.dart';
import 'package:movies/ui/views/under_dev/under_dev_view.dart';
import 'package:movies/ui/views/watch/watch_view.dart';
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
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: getViewForIndex(viewModel.currentIndex),
      ),
      extendBody: false,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          items: [
            _bottomNavBarItem(
              iconPath: AppIcons.dashboardIcon,
              label: "Dashboard",
            ),
            _bottomNavBarItem(
              iconPath: AppIcons.watchIcon,
              label: "Watch",
            ),
            _bottomNavBarItem(
              iconPath: AppIcons.libraryIcon,
              label: "Media Library",
            ),
            _bottomNavBarItem(
              iconPath: AppIcons.moreIcon,
              label: "More",
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(
      {required String iconPath, required String label}) {
    getIcon({isActive = false}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          iconPath,
          height: 18.h,
          width: 18.w,
          colorFilter: ColorFilter.mode(
            isActive ? AppColors.kWhiteColor : AppColors.kGreyColor,
            BlendMode.srcIn,
          ),
        ),
      );
    }

    return BottomNavigationBarItem(
      icon: getIcon(),
      activeIcon: getIcon(isActive: true),
      label: label,
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const UnderDevView();
      case 1:
        return const WatchView();
      case 2:
        return const UnderDevView();
      case 3:
        return const UnderDevView();
      default:
        return const WatchView();
    }
  }

  @override
  RootViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RootViewModel();

  @override
  void onViewModelReady(RootViewModel viewModel) {
    viewModel.setIndex(1);
    super.onViewModelReady(viewModel);
  }
}
