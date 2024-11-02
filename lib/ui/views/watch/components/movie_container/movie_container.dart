import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/my_utils.dart';
import 'package:shimmer/shimmer.dart';

class MovieContainer extends StatelessWidget {
  final double height;
  final double width;

  const MovieContainer({
    super.key,
    this.height = 220,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: Container(
            height: (height / 2) - 20,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.kBlackColor,
                  AppColors.kBlackColor.withOpacity(0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "The King's Man",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.kWhiteColor,
                    ),
              ),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: MyUtils.getTempLink(
              height: height.toInt(),
              width: 1.sw.toInt(),
            ),
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
    );
  }
}
