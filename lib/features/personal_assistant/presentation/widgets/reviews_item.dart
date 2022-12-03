import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../../../style/app_images.dart';

class ReviewItem extends StatelessWidget {
  ReviewItem({
    Key? key,
    required this.image,
    required this.reviewerName,
    required this.reviewsContent,
    required this.trailing,
    required this.height,
    required this.expandingBoolean,
  }) : super(key: key);
  final String image;
  final String reviewerName;
  final String reviewsContent;
  final double height;
  Widget trailing;

  bool expandingBoolean;
  List<String> ratingStars = [
    AppImages.star,
    AppImages.star,
    AppImages.star,
    AppImages.star,
    AppImages.star,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height,
      width: 344.w,
      decoration: BoxDecoration(
          color:const Color(0xff515A75), borderRadius: BorderRadius.circular(40)),
      child: SizedBox(
        width: 344.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 31.h,
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: Container(
                  height: 66.w,
                  width: 66.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: Text(
                reviewerName,
                style: AppTextStyle.whiteBold.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              subtitle: Text(
                '1 Hour ago',
                style: AppTextStyle.appHintStyle.copyWith(
                  color: const Color(0xffFFFFFF).withOpacity(0.56),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: trailing,
            ),
            expandingBoolean
                ? Expanded(
                    child: SizedBox(
                      width: 300.w,
                      height: 100.h,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 18.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.h),
                            child: Text(
                              reviewsContent,
                              style: AppTextStyle.appHintStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: ratingStars
                                .map(
                                  (e) => SizedBox(
                                    height: 20.h,
                                    width: 23.w,
                                    child: SvgPicture.asset(
                                      e,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
