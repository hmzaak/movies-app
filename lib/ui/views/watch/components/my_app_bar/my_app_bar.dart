import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_icons.dart';
import 'package:movies/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'my_app_bar_model.dart';

class MyAppBar extends StackedView<MyAppBarModel>
    implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget builder(
    BuildContext context,
    MyAppBarModel viewModel,
    Widget? child,
  ) {
    return AppBar(
      title: viewModel.showSearchBar
          ? null
          : Text(
              "Watch",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
      centerTitle: false,
      actions: [
        AnimatedCrossFade(
          firstChild: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.kBackgoundColor,
            ),
            onPressed: () {
              viewModel.showSearchBar = true;
            },
            icon: SvgPicture.asset(AppIcons.searchIcon),
          ),
          secondChild: SizedBox(
            width: 1.sw - 40,
            child: CustomTextField(
              controller: viewModel.searchController,
              hintText: "TV Shows, Movies and more",
              prefix: SvgPicture.asset(AppIcons.searchIcon),
              onChanged: (query) {
                viewModel.searchWithDelay(query!);
              },
              suffix: GestureDetector(
                onTap: () {
                  viewModel.showSearchBar = false;
                  viewModel.onTypingStop();
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
          crossFadeState: viewModel.showSearchBar
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        20.horizontalSpace,
      ],
    );
  }

  @override
  MyAppBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyAppBarModel();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
