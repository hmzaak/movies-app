import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/ui_helpers.dart';
import 'package:movies/ui/views/search/search_view.dart';
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
          : viewModel.isTyping && viewModel.showSearchBar
              ? const SearchView()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: viewModel.scrollController,
                        padding: EdgeInsets.all(20.sp),
                        itemBuilder: (context, index) {
                          return MovieContainer(
                            movie: viewModel.allMovies[index],
                          );
                        },
                        separatorBuilder: (context, index) => 10.verticalSpace,
                        itemCount: viewModel.allMovies.length,
                      ),
                    ),
                    if (viewModel.fetchingMoreMovies) ...[
                      const Center(child: CircularProgressIndicator()),
                      verticalSpaceMedium,
                    ]
                  ],
                ),
    );
  }

  @override
  WatchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchViewModel();

  @override
  void onViewModelReady(WatchViewModel viewModel) {
    viewModel.scrollController.addListener(viewModel.onScroll);
    super.onViewModelReady(viewModel);
  }
}
