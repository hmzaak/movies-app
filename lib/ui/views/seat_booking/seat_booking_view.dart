import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_icons.dart';
import 'package:stacked/stacked.dart';

import 'seat_booking_viewmodel.dart';

class SeatBookingView extends StackedView<SeatBookingViewModel> {
  const SeatBookingView(this.movie, {Key? key}) : super(key: key);
  final Movie movie;

  @override
  Widget builder(
    BuildContext context,
    SeatBookingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        centerTitle: true,
        title: Text(
          movie.originalTitle,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.verticalSpace,
            SvgPicture.asset(
              AppIcons.screenIcon,
            ),
            Text(
              "SCREEN",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey, fontSize: 8.sp),
            ),
            32.verticalSpace,
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 500.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SeatLayoutWidget(
                    onSeatStateChanged: viewModel.onSeatStateChanged,
                    stateModel: SeatLayoutStateModel(
                      rows: 10,
                      cols: 26,
                      seatSvgSize: 20,
                      pathSelectedSeat: AppIcons.seatSelectedIcon,
                      pathDisabledSeat: AppIcons.seatDisabledIcon,
                      pathSoldSeat: AppIcons.seatVipIcon,
                      pathUnSelectedSeat: AppIcons.seatRegularIcon,
                      currentSeatsState: viewModel.seatArrangement,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _iconGuide(
                        icon: AppIcons.seatSelectedIcon,
                        text: "Selected",
                      ),
                      _iconGuide(
                        icon: AppIcons.seatDisabledIcon,
                        text: "Not Available",
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _iconGuide(
                        icon: AppIcons.seatVipIcon,
                        text: "VIP(\$150)",
                      ),
                      _iconGuide(
                        icon: AppIcons.seatRegularIcon,
                        text: "Regular(\$50)",
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.kLightGreyColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                        "Selected Seats: ${viewModel.selectedSeats.length}"),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Proceed to Pay"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _iconGuide({required String icon, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        10.horizontalSpace,
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  SeatBookingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SeatBookingViewModel();
}
