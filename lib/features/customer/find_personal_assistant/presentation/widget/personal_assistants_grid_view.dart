import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/search_filters_assistants.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../style/app_colors.dart';
import '../../../../../style/app_images.dart';
import '../../../../../style/app_text_style.dart';
import '../../../../../style/dimensions_controller.dart';
import '../business_logic/statecontroller/find personal_assistant_state_controller.dart';

class PersonalAssistantGridView extends StatelessWidget {
 const  PersonalAssistantGridView({Key? key}) : super(key: key);
final  List <String >personalStars=const[AppImages.personalFillStar,AppImages.personalFillStar,AppImages.personalEmptyStar,AppImages.personalEmptyStar,AppImages.personalEmptyStar];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context,ref,_) {
            return AnimatedContainer(
              duration:const Duration(milliseconds: 100),
              height: ref.watch(searchBarHeightProvider)==48.h?470.h:600.h,
              child: AnimationLimiter(

                child: Consumer(
                  builder: (context, ref, _) => NotificationListener<ScrollNotification>(
                    onNotification: (notification){
                      if(notification.metrics.pixels>50){
                        ref.watch(filterBarHeightProvider.notifier).state=0;
                        ref.watch(searchBarHeightProvider.notifier).state=0;
                      }else if(notification.metrics.pixels<300){
                        ref.watch(filterBarHeightProvider.notifier).state=0.07;
                         ref.watch(searchBarHeightProvider.notifier).state=48.h;
                      }

                      return true;

                    },
                    child: GridView.builder(
                      shrinkWrap: true,
                      controller: ref.watch(personalAssistantListScrollController),
                      physics:const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: ref.watch(listOfPersonalAssistantsNames).length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: Sizer.h(context, 0.01),
                        crossAxisCount: 2,
                        crossAxisSpacing: Sizer.w(context, 0.06),
                      ),
                      itemBuilder: (context, i) {
                        return AnimationConfiguration.staggeredGrid(
                          position: i,
                          duration: const Duration(milliseconds: 500),
                          columnCount: 2,
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              child: SizedBox(
                                height: Sizer.h(context, 0.05),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                                .watch(chosenPersonalAssistantName.notifier)
                                                .state =
                                            ref.watch(listOfPersonalAssistantsNames)[i];
                                        ref
                                            .watch(chosenPersonalAssistantImage.notifier)
                                            .state = AppImages.reviewer_one;
                                        Navigator.pushNamed(
                                            context, PERSONAL_ASSISTANT_PICKED_FROM_LIST);
                                      },
                                      child: Container(
                                        height: Sizer.h(context, 0.145),
                                        width: 156.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.primaryColor.withOpacity(0.3),
                                          // TODO HERE IM GOING TO ENABLE THE CONTAINER AND PUT THE PERSONAL ASSISTANT IMAGE COMING FROM API AS A BACKGROUND OF THE CONTAINER
                                          image: const DecorationImage(
                                            image: AssetImage(AppImages.reviewer_one),
                                            fit: BoxFit.cover,
                                          ),
                                        ),child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: 12.w),
                                            child: SizedBox(
                                              //width:75.w,
                                             height: 9.h,
                                              child: ListView.builder(

                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: personalStars.length,
                                                physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder:(context,index) => Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                                                child: SizedBox(
                                                  width: 7.w,
                                                child: SvgPicture.asset(personalStars[index],),),
                                              ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: (5.1).h,)
                                        ],
                                      ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Sizer.h(context, 0.02),
                                    ),
                                    Text(
                                      ref.watch(listOfPersonalAssistantsNames)[i],
                                      // getPersonalAssistantNames(),
                                      style: AppTextStyle.blackMedium.copyWith(
                                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
