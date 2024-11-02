import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/ui_helpers.dart';
import 'package:movies/ui/views/movie_details/components/my_sliver_app_bar.dart';
import 'package:movies/ui/widgets/common/genre_container/genre_container.dart';
import 'package:stacked/stacked.dart';
import 'movie_details_viewmodel.dart';

class MovieDetailsView extends StackedView<MovieDetailsViewModel> {
  const MovieDetailsView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    MovieDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(child: child!),
          SliverPadding(
            padding: EdgeInsets.all(20.sp),
            sliver: SliverList.list(
              children: [
                Text(
                  "Genres",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.verticalSpace,
                Wrap(
                  runSpacing: 7.h,
                  spacing: 7.w,
                  children: const [
                    GenreContainer(
                      color: AppColors.kLightGreenColor,
                      genre: "Action",
                    ),
                    GenreContainer(
                      color: AppColors.kPinkColor,
                      genre: "Thriller",
                    ),
                    GenreContainer(
                      color: AppColors.kPurpleColor,
                      genre: "Science",
                    ),
                    GenreContainer(
                      color: AppColors.kDarkYellowColor,
                      genre: "Fiction",
                    ),
                  ],
                ),
                spacedDivider,
                Text(
                  "Overview",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.verticalSpace,
                Text(
                  "The quick small brown fox jumps over a lazy dog." * 40,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.kGreyColor,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  MovieDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MovieDetailsViewModel();

  @override
  Widget? staticChildBuilder(BuildContext context) {
    return AutoSizeText(
      "Movie Name",
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: AppColors.kWhiteColor),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
