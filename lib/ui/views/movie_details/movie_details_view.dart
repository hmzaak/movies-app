import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/ui_helpers.dart';
import 'package:movies/ui/views/movie_details/components/movie_image_container.dart';
import 'package:movies/ui/views/movie_details/components/my_sliver_app_bar.dart';
import 'package:movies/ui/widgets/common/genre_container/genre_container.dart';
import 'package:stacked/stacked.dart';
import 'movie_details_viewmodel.dart';

class MovieDetailsView extends StackedView<MovieDetailsViewModel> {
  final Movie movie;
  const MovieDetailsView(this.movie, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MovieDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            title: child!,
            movie: movie,
            videoId: viewModel.videoId,
            isTrailerLoading: viewModel.isTrailerLoading,
          ),
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
                  movie.overview,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.kGreyColor,
                      ),
                ),
                20.verticalSpace,
                Text(
                  "Image Gallery",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                if (viewModel.imagesLoading)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                else if (viewModel.images?.isEmpty == true)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: const Text("No Images Found"),
                    ),
                  ),
              ],
            ),
          ),
          if (viewModel.images != null)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid.builder(
                itemCount: viewModel.images!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return MovieImageContainer(
                    imageUrl: viewModel.images![index],
                  );
                },
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
  void onViewModelReady(MovieDetailsViewModel viewModel) {
    viewModel.getMovieImages(movie.id);
    viewModel.getMovieTrailer(movie.id);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget? staticChildBuilder(BuildContext context) {
    return AutoSizeText(
      movie.originalTitle,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: AppColors.kWhiteColor),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
