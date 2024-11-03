import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class MovieImageContainer extends StatelessWidget {
  final String imageUrl;

  const MovieImageContainer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
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
    );
  }
}
