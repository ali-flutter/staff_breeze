import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/add_review_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/about_me_and_reviews_list.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/about_me_widget.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:status_alert/status_alert.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import '../../../../../core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import '../../../../../core/network_configration/result.dart';
import '../../../../../style/app_colors.dart';
import '../../../../../style/app_images.dart';
import '../../../../../style/dimensions_controller.dart';
import '../../domain/entities/add_review_entity.dart';
import '../widget/personal_assistant_profile_widget/aboutme_reviews_sliding_switch.dart';

class PersonalAssistantProfile extends StatefulWidget {
  const PersonalAssistantProfile({Key? key}) : super(key: key);

  @override
  State<PersonalAssistantProfile> createState() =>
      _PersonalAssistantProfileState();
}

class _PersonalAssistantProfileState extends State<PersonalAssistantProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? Container()
          : Consumer(builder: (context, ref, _) {
              return GestureDetector(
                onTap: ref.watch(isGuestProvider)
                    ? null
                    : () {
                        Navigator.pushNamed(context, CUSTOMER_PROFILE);
                      },
                child: Container(
                  height: 82.h,
                  width: 82.w,
                  decoration: const BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff6D7EB4).withOpacity(0.65),
                            offset: const Offset(4, 10),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                          child: SizedBox(
                        height: (23.1).h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          AppImages.profileIcon,
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              );
            }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        clipBehavior: Clip.none,
        color: AppColors.scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 30.h,
        ),
      ),
      backgroundColor: Colors.white,
      //AppColors.primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Consumer(builder: (context, ref, _) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).padding.top *
                          10.4, //320.h, //Sizer.h(context, 0.32),
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: ref.watch(chosenPersonalAssistantImage) != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  imagesUrl +
                                      ref.watch(chosenPersonalAssistantImage)!,
                                ),
                                fit: BoxFit.cover)
                            : null,
                        color: const Color(0xff515A75),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).padding.top *
                          10.4, //320.h, //Sizer.h(context, 0.32),
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.shadow),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w, right: 21.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                              iconSize: 26.sp,
                            ),
                            SizedBox(
                              height: Sizer.h(context, 0.14),
                            ),
                            Text(
                              ref.watch(chosenPersonalAssistantName) ?? '',
                              style: AppTextStyle.whiteBold.copyWith(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Stars widget
                                IgnorePointer(
                                  child: RatingBar(
                                    itemSize: 25.h,
                                    initialRating: ref.watch(
                                            chosenPersonalAssistantRatingAvrage) ??
                                        0,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    maxRating: 5,
                                    allowHalfRating: true,
                                    ratingWidget: RatingWidget(
                                      empty: SizedBox(
                                          height: 16.h,
                                          width: 13.w,
                                          child: SvgPicture.asset(
                                              AppImages.personalEmptyStar)),
                                      full: SizedBox(
                                          height: 16.h,
                                          width: 13.w,
                                          child: SvgPicture.asset(
                                              AppImages.personalFillStar)),
                                      half: SizedBox(
                                          height: 16.h,
                                          width: 13.w,
                                          child: SvgPicture.asset(
                                              AppImages.personalEmptyStar)),
                                    ),
                                    onRatingUpdate: (value) {
                                      ref
                                          .watch(leaveRatingProvider.notifier)
                                          .state = value;
                                    },
                                  ),
                                ),

                                // hire button Widget
                                Column(
                                  children: [
                                    AppButtons(
                                      buttonText: 'HIRE',
                                      buttonColor: AppColors.primaryColor,
                                      onPressed: () {
                                        ref.watch(isGuestProvider) == false
                                            ? Navigator.pushNamed(
                                                context, PICK_A_DATE)
                                            : AppDialogs.warningDialog(context,
                                                warning:
                                                    'You should Register first',
                                                onConfirmBtnTapped: () {
                                                Navigator.pushNamed(
                                                    context, REGISTER);
                                              });
                                      },
                                      height: 32.h,
                                      width: 114.w,
                                      buttonTextStyle:
                                          AppTextStyle.whiteBold.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff181928),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff181928),
                        spreadRadius: 6,
                        blurRadius: 90,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.w(context, 0.06),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Sizer.h(context, 0.035),
                        ),
                        Consumer(builder: (context, ref, _) {
                          return AboutMeReviewsSlidingSwitch(
                            onAddAReviewBtnPressed: () {
                              _showMyDialog(context, ref).then((value) {
                                print("value");
                                return BlocProvider.of<GetReviewsCubit>(context).getReviews(assistantId: ref.watch(chosenAssistantIdProvider) ??0);
                              });

                            },
                          );
                        }),
                        Consumer(builder: (context, ref, _) {
                          return SizedBox(
                              height: !ref.watch(reviewsOrAboutMeProvider)
                                  ? 27.h
                                  : 0.h //Sizer.h(context, 0.039),
                              );
                        }),
                        Flexible(
                          child: Consumer(builder: (context, ref, _) {
                            return ref.watch(reviewsOrAboutMeProvider)
                                ? SizedBox(
                                    height: Sizer.h(context, 0.445),
                                    child: BlocProvider(
                                      create: (context) =>
                                          getIt<GetReviewsCubit>(),
                                      child: AboutMeReviewsList(),
                                    ),
                                  )
                                : const AboutMeWidget();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return BlocProvider<AddReviewCubit>.value(
          value: getIt<AddReviewCubit>(),
          child: /*(context) {
            return*/
              AlertDialog(
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
                        itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
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
                              child: const Icon(
                                Icons.star,
                                color: Colors.grey,
                              )),
                          full: SizedBox(
                              height: 16.h,
                              width: 13.w,
                              child: const Icon(
                                Icons.star,
                                color: Colors.white,
                              )),
                          half: SizedBox(
                            height: 16.h,
                            width: 13.w,
                            child: const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ),
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
                  listener: (context, state) => state.when(
                        () => null,
                        loading: () => null,
                        initial: () => null,
                        error: (e, s) => ErrorWidget('error'),
                        success: (success) {

                          Navigator.pop(context);
                          Navigator.popAndPushNamed(context, PERSONAL_ASSISTANT_PICKED_FROM_LIST);
                          //BlocProvider.of<GetReviewsCubit>(context).getReviews(assistantId: ref.watch(chosenAssistantIdProvider)??0);
                        /*  StatusAlert.show(
                            context,
                            blurPower: 50,
                            duration: Duration(seconds: 2),
                            title: 'Review Added',
                            subtitle: 'Your Review was Added Successfully',
                            configuration:
                                const IconConfiguration(icon: Icons.done),
                            maxWidth: 260,
                            dismissOnBackgroundTap: true,
                          );*/
                        },
                      ),
                  builder: (context, state) {
                    if (state is Loading) {
                      return SizedBox(
                        width: 65.w,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      return Consumer(builder: (context, ref, _) {
                        return TextButton(
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            ref.watch(isGuestProvider) == false
                                ? bearerTokenRetreiver().then(
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
                                  )
                                : AppDialogs.warningDialog(context,
                                    warning: 'You should register first',
                                    onConfirmBtnTapped: () {
                                    Navigator.pushNamed(context, REGISTER);
                                  });
                          },
                        );
                      });
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
