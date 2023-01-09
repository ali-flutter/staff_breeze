import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_review_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/add_review_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../../../../../injection_container/injection.dart';
import '../../../../../../style/app_images.dart';

class AboutMeReviewsSlidingSwitch extends StatelessWidget {
  const AboutMeReviewsSlidingSwitch({Key? key,required this.onAddAReviewBtnPressed}) : super(key: key);
  final void Function()?  onAddAReviewBtnPressed;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return SizedBox(
        // height: 44.h,
        //  width: 343.w,
        child: Stack(
          children: [
            SlidingSwitch(
                width: 343.w,
                background: const Color(0xff515A75),
                buttonColor: AppColors.primaryColor,
                animationDuration: const Duration(milliseconds: 100),
                textOn: 'Reviews',
                textOff: 'About Me',
                colorOff: Colors.white,
                colorOn: Colors.white,
                inactiveColor: const Color(0xffFFFFFF).withOpacity(0.6),
                value: false,
                onChanged: (value) {
                  print(value);
                  ref.watch(reviewsOrAboutMeProvider.notifier).state = value;
                },
                //iconOn: Icons.add,
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {}),
            ref.watch(reviewsOrAboutMeProvider) == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h, right: 10.w),
                        child: IconButton(
                            onPressed: onAddAReviewBtnPressed,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            )),
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      );
    });
  }

 /* Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
     // barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.primaryColor.withOpacity(.91),
          title: const Text(
            'Leave a Review',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Consumer(builder: (context, ref, _) {
              return ListBody(
                children: <Widget>[
                  Text(
                    'leave a review to help ${ref.watch(chosenPersonalAssistantName)}',
                    style: AppTextStyle.whiteBold.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      elevation: 0,
                      child: SizedBox(
                        height: 73.h,
                        width: 316.w,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TextFormField(
                              style: AppTextStyle.appHintStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              minLines: 1,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (reviewValue) {
                                ref.watch(reviewContent.notifier).state =
                                    reviewValue;
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 35.h),
                  Center(
                    child: RatingBar(
                      itemSize: 26.h,
                      initialRating: 0,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      maxRating: 5,
                      allowHalfRating: true,
                      ratingWidget: RatingWidget(
                        empty: SizedBox(
                            height: 16.h,
                            width: 13.w,
                            child:
                                SvgPicture.asset(AppImages.personalEmptyStar)),
                        full: SizedBox(
                            height: 16.h,
                            width: 13.w,
                            child:
                                SvgPicture.asset(AppImages.personalFillStar)),
                        half: SizedBox(
                            height: 16.h,
                            width: 13.w,
                            child:
                                SvgPicture.asset(AppImages.personalEmptyStar)),
                      ),
                      onRatingUpdate: (value) {
                        ref.watch(leaveRatingProvider.notifier).state = value;
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BlocConsumer<AddReviewCubit, Result<AddReviewEntity>>(
               // bloc: getIt<AddReviewCubit>(),
                listener: (context, state) => state.when(() => null,
                    loading: () => null,
                    initial: () => null,
                    error: (e, s) =>ErrorWidget('error') ,
                    success: (success) => Navigator.pop(context),
                ),
                builder: (context, state) => state.when(() => Container(),
                    loading: () => const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                    initial: () => Consumer(builder: (context, ref, _) {
                          return TextButton(
                            child: const Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                            ref.watch(isGuestProvider)==false?
                            bearerTokenRetreiver().then(
                                (value) =>
                                    BlocProvider.of<AddReviewCubit>(context)
                                        .addReview(
                                  bearer_token: "Bearer $value",
                                  assistant_id: ref.watch(
                                          chosenAssistantIdProvider) ??
                                      0,
                                  rating: ref
                                      .watch(leaveRatingProvider)
                                      .round(),
                                  body: ref.watch(reviewContent),
                                ),
                              ):AppDialogs.warningDialog(context,
                                warning: 'You should register first',
                                onConfirmBtnTapped: (){
                                Navigator.pushNamed(context, REGISTER);
                                });
                            },
                          );
                        }),
                    error: (e, s) => Consumer(builder: (context, ref, _) {
                          return TextButton(
                            child: const Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              bearerTokenRetreiver().then(
                                (value) =>
                                    BlocProvider.of<AddReviewCubit>(context).addReview(
                                  bearer_token: "Bearer $value",
                                  assistant_id: ref.watch(
                                          chosenAssistantIdProvider) ??
                                      0,
                                  rating: ref
                                      .watch(leaveRatingProvider)
                                      .round(),
                                  body: ref.watch(reviewContent),
                                ),
                              );
                            },
                          );
                        }),
                    success: (response) {
                      return Consumer(builder: (context, ref, _) {
                        return TextButton(
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            bearerTokenRetreiver().then(
                              (value) =>
                                  BlocProvider.of<AddReviewCubit>(context)
                                      .addReview(
                                bearer_token: "Bearer $value",
                                assistant_id:
                                    ref.watch(chosenAssistantIdProvider) ??
                                        0,
                                rating:
                                    ref.watch(leaveRatingProvider).round(),
                                body: ref.watch(reviewContent),
                              ),
                            );
                          },
                        );
                      });
                    })),
          ],
        );
      },
    );
  }*/
}
