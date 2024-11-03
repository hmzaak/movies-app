import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.router.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_strings.dart';
import 'package:movies/ui/widgets/common/invisible_header/invisible_header.dart';
import 'package:stacked_services/stacked_services.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget title;
  final Movie movie;
  final String? videoId;
  final bool isTrailerLoading;

  const MySliverAppBar({
    super.key,
    required this.title,
    required this.movie,
    this.videoId,
    required this.isTrailerLoading,
  });

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = movie.backdropPath ?? movie.posterPath ?? '';
    String imageUrl = imagesBaseUrl + imagePath;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.kPrimaryColor,
      title: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.kWhiteColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      actions: [
        InvisibleExpandedHeader(
          minHeight: 175,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.book_online_rounded,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_rounded,
                ),
              ),
              10.horizontalSpace,
            ],
          ),
        ),
      ],
      expandedHeight: 0.5.sh,
      floating: false,
      pinned: true,
      titleSpacing: 0,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        title: InvisibleExpandedHeader(
          minHeight: 175,
          replacement: Padding(
            padding: EdgeInsets.all(40.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: title,
                ),
                Text(
                  "In Theaters ${formatDate(movie.releaseDate)}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.kWhiteColor),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Tickets"),
                ),
                10.verticalSpace,
                OutlinedButton.icon(
                  onPressed: videoId != null
                      ? () {
                          locator<NavigationService>().navigateToTrailerView(
                            videoId: videoId!,
                          );
                        }
                      : null,
                  icon: isTrailerLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Icon(
                          videoId != null
                              ? Icons.play_arrow_rounded
                              : Icons.warning_amber_rounded,
                        ),
                  label: Text(
                    isTrailerLoading
                        ? "Loading..."
                        : videoId != null
                            ? "Watch Trailer"
                            : "Trailer not found",
                  ),
                )
              ],
            ),
          ),
          child: title,
        ),
        centerTitle: true,
        background: GridTile(
          footer: Container(
            width: double.infinity,
            height: 350.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.kBlackColor,
                  Colors.black.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          child: Hero(
            tag: movie.id,
            transitionOnUserGestures: true,
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return CircularProgressIndicator.adaptive(
                  value: progress.progress,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
