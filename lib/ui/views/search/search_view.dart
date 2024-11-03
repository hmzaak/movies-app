import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';

import 'package:movies/ui/views/watch/components/movie_container/movie_container.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isSearchLoading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : viewModel.searchedMovies.isEmpty
            ? Center(
                child: Text(
                  "No upcoming movies",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.kBlackColor,
                      ),
                ),
              )
            : ListView.separated(
                itemCount: viewModel.searchedMovies.length,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 10.h,
                ),
                itemBuilder: (context, index) {
                  return MovieContainer(
                    movie: viewModel.searchedMovies[index],
                  );
                },
                separatorBuilder: (context, index) => 10.verticalSpace,
              );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
