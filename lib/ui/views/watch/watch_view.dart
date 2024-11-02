import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/views/watch/components/movie_container/movie_container.dart';
import 'package:movies/ui/views/watch/components/my_app_bar/my_app_bar.dart';
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
      body: viewModel.fetchingMovies
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.separated(
              padding: EdgeInsets.all(20.sp),
              itemBuilder: (context, index) {
                return MovieContainer(
                  movie: viewModel.allMovies[index],
                );
              },
              separatorBuilder: (context, index) => 10.verticalSpace,
              itemCount: viewModel.allMovies.length,
            ),
    );
  }

  @override
  WatchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchViewModel();
}
