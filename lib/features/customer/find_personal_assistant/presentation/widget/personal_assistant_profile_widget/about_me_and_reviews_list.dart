
import 'dart:math' as math;
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/reviews_item.dart';
import 'package:staff_breeze/style/app_images.dart';
import '../../../../../personal_assistant/presentation/widgets/reviews_item.dart';
import '../../business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import '../../../../../../style/dimensions_controller.dart';

class AboutMeReviewsList extends StatefulWidget {
  const AboutMeReviewsList({super.key});

  @override
  State<AboutMeReviewsList> createState() => _AboutMeReviewsListState();
}

class _AboutMeReviewsListState extends State<AboutMeReviewsList> {
   List trailings = [
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
  ];
   List expanders=[false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, i) {
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 20.h),
          child: ReviewItem(
              image:AppImages.reviewer_one,//reviewersImages()[i],
              reviewerName: getReviewrName()[i],
              reviewsContent: '                    He is so good',
              trailing: IconButton(
                onPressed: (){
                  setState(() {
                    if(trailings[i]==Icons.keyboard_arrow_down_rounded){
                      trailings[i]=Icons.keyboard_arrow_up_rounded;
                    }else{
                      trailings[i]=Icons.keyboard_arrow_down_rounded;
                    }
                    expanders[i]=!expanders[i];
                  });
                },
                icon: Icon(trailings[i],color: const Color(0xff707070),size: 28.sp,),
              ),
              height: expanders[i]?237.h:130.h,
              expandingBoolean: expanders[i]),
        );
      },
    );
  }
List getReviewrName(){
    List names=['Renato Sanchez','Alex Montari','Remy San','Diego Font','Roman Star'];
    return names;
  }
/*List reviewersImages(){
    List images=[AppImages.blueGirl,AppImages.pinkeyGirl,AppImages.reviewer_one,AppImages.reviewer_four,AppImages.yellowMan,];
    return images;
}*/
}