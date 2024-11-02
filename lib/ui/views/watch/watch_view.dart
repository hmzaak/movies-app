import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/widgets/common/movie_container/movie_container.dart';
import 'package:movies/ui/widgets/common/my_app_bar/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'watch_viewmodel.dart';

class WatchView extends StackedView<WatchViewModel> {
  const WatchView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    WatchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: ListView.separated(
        padding: EdgeInsets.all(20.sp),
        itemBuilder: (context, index) {
          return const MovieContainer();
        },
        separatorBuilder: (context, index) => 10.verticalSpace,
        itemCount: 10,
      ),
    );
  }

  @override
  WatchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchViewModel();
}
