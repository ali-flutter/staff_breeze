import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../style/app_colors.dart';
import '../../../../../style/app_text_style.dart';
import '../../../../../style/dimensions_controller.dart';
import '../business_logic/statecontroller/find personal_assistant_state_controller.dart';


class PersonalAssistantGridView extends StatelessWidget {
  const PersonalAssistantGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 441.h,//MediaQuery.of(context).size.height,
      child: AnimationLimiter(
        child: Consumer(
          builder: (context,ref,_) => GridView.builder(
                physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: ref.watch(listOfPersonalAssistantsNames).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: Sizer.h(context, 0.06),
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizer.w(context, 0.1),
                ),
                itemBuilder: (context, i) {
                  return AnimationConfiguration.staggeredGrid(
                    position: i,
                    duration:const Duration(milliseconds: 500),
                    columnCount: 2,
                    child: ScaleAnimation(
                      duration:const Duration(milliseconds: 900),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        child: SizedBox(
                          height: Sizer.h(context, 0.05),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ref.watch(chosenPersonalAssistantName.notifier).state=
                                  ref.watch(listOfPersonalAssistantsNames)[i];
                                  ref.watch(chosenPersonalAssistantImage.notifier).state=
                                  ref.watch(listOfPersonalAssistantImages)[i];
                                  Navigator.pushNamed(
                                      context, PERSONAL_ASSISTANT_PICKED_FROM_LIST);
                                },
                                child: Container(
                                  height: Sizer.h(context, 0.145),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primaryColor.withOpacity(0.3),
                                    // TODO HERE IM GOING TO ENABLE THE CONTAINER AND PUT THE PERSONAL ASSISTANT IMAGE COMING FROM API AS A BACKGROUND OF THE CONTAINER
                                     image: DecorationImage(
                                          image: AssetImage(ref.watch(listOfPersonalAssistantImages)[i]),
                                          fit: BoxFit.cover,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Sizer.h(context, 0.02),
                              ),
                              Text(ref.watch(listOfPersonalAssistantsNames)[i],
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
                })
        ),
      ),
    );
  }
}
