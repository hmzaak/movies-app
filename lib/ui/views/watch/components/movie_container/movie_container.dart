import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.router.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_strings.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieContainer extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;

  const MovieContainer({
    super.key,
    this.height = 230,
    this.width = double.infinity,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath = movie.backdropPath ?? movie.posterPath ?? '';
    String imageUrl = imagesBaseUrl + imagePath;
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateToMovieDetailsView();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: Container(
              height: (height / 2) - 35,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.kBlackColor,
                    AppColors.kBlackColor.withOpacity(0.01),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.kWhiteColor,
                      ),
                ),
              ),
            ),
            child: Hero(
              tag: movie.id,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Icon(
                      Icons.error,
                      color: AppColors.kErrorColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
