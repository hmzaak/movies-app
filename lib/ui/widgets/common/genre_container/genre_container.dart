import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/ui/common/app_colors.dart';

class GenreContainer extends StatelessWidget {
  final Genre genre;

  const GenreContainer({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: genre.color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        genre.name,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.kWhiteColor,
            ),
      ),
    );
  }
}
