import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/style/app_images.dart';

import '../../style/app_colors.dart';
import '../../style/app_text_style.dart';
import '../network_configration/base_network_config.dart';

class ExpandableCard extends StatelessWidget {
  const ExpandableCard({super.key,
  required this.image,
  required this.body,
  required this.name,
  required this.ratingAverage,
  required this.reviewsTime,
  });
   final String image;
   final String name;
   final String  reviewsTime;
   final String body;
   final double ratingAverage;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      color: const Color(0xff515A75),
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          ExpansionTile(
             
            leading: Padding(
              padding: EdgeInsets.only(left:50.w),
              child: Container(
                height: 66.w,
                width: 66.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(/*imagesUrl+*/image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              name,
              style: AppTextStyle.whiteBold.copyWith(
                fontSize: 16.sp,
              ),
            ),
            subtitle: Text('$reviewsTime',style: AppTextStyle.appHintStyle.copyWith(
              color:const Color(0xffffffff).withOpacity(.56),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),),
           
            children: [
              SizedBox(
                height: 86.h,
                width: 279.w,
                child: Center(
                  child: Text(body,style: AppTextStyle.appHintStyle.copyWith(
                    color:const Color(0xffFFFFFF).withOpacity(.64),
                    fontWeight: FontWeight.w400,
                     fontSize: 14.sp
                  ),),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: RatingBar(
                  itemSize:16.h ,
                  
                  initialRating: ratingAverage,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  maxRating: 5,
                  allowHalfRating: true,
                  ratingWidget: RatingWidget(
                    empty:SizedBox(height: 16.h,width: 13.w,child: SvgPicture.asset(AppImages.personalEmptyStar)) ,
                    full:SizedBox(height: 16.h,width: 13.w,child:SvgPicture.asset(AppImages.personalFillStar) ),
                    half:SizedBox(height: 16.h,width: 13.w,child:SvgPicture.asset(AppImages.personalEmptyStar) ),
                    ),
                    onRatingUpdate: (value){
                     print(value);
                    },
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}
