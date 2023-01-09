import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/expandable_card_widget.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/controller/personal_assistant_home_page_state_controller.dart';

import '../../../../../core/network_configration/result.dart';
import '../../../../../style/app_text_style.dart';

class ReviewsSection extends ConsumerStatefulWidget {
  const ReviewsSection({super.key});

  @override
  ReviewsSectionState createState() => ReviewsSectionState();
}

class ReviewsSectionState extends ConsumerState<ReviewsSection> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300), upperBound: 0.5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: ref.watch(isReviewSectionExpanded) == false ? MediaQuery.of(context).size.height * 0.15 : 480.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
          color: Color(0xff423050)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsetsDirectional.only(start: (0.5).w, end: 0, bottom: (1.5).h),
        height: ref.watch(isReviewSectionExpanded) == false ? MediaQuery.of(context).size.height * 0.15 : 480.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
          color: Color(0xff181928),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 46.5.w,
                  ),
                  Text(
                    'Reviews  ',
                    style: AppTextStyle.whiteBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 140.w,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
                      child: IconButton(
                        onPressed: () {
                          if (ref.watch(isReviewSectionExpanded)) {
                            _animationController.reverse(from: 0.5);
                          } else if (!ref.watch(isReviewSectionExpanded)) {
                            _animationController.forward(from: 0.0);
                          }
                          ref.watch(isReviewSectionExpanded.notifier).state = !ref.watch(isReviewSectionExpanded);
                          if (ref.watch(isReviewSectionExpanded)) {
                            ref.watch(notificationScheduleHeight.notifier).state = 0;
                            ref.watch(aboutMeHeight.notifier).state = 0;
                            ref.watch(notExpandedAboutSectionHeight.notifier).state = 0.h;
                          } else {
                            ref.watch(notExpandedAboutSectionHeight.notifier).state = 130.h;
                            ref.watch(notificationScheduleHeight.notifier).state = 130.h;
                            ref.watch(aboutMeHeight.notifier).state = 350.h;
                          }

                          // scrollController.jumpTo(scrollController.position.maxScrollExtent);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              ref.watch(isReviewSectionExpanded)
                  ? Expanded(
                      child: SizedBox(
                        height: 400.h,
                        width: MediaQuery.of(context).size.width * 1,
                        child: BlocBuilder<GetReviewsCubit, Result<GetReviewsEntity>>(
                          builder: (context, state) => state.when(() => Container(),
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              initial: () => Container(),
                              error: (error, s) => Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          error!,
                                          style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff998FA2), fontSize: 12.sp, fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Retry'),
                                        )
                                      ],
                                    ),
                                  ),
                              success: (response) {
                                if (response is GetReviewsEntity && response.data.isNotEmpty) {
                                  return ListView.builder(
                                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: response.data.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                                          child: ExpandableCard(
                                            image: response.data[i].clientProfileImage,
                                            body: response.data[i].body,
                                            name: response.data[i].clientName,
                                            ratingAverage: response.data[i].rating, //response.data[i],
                                            reviewsTime: response.data[i].createdAt,
                                          ),
                                        );
                                      });
                                } else if (response is GetReviewsEntity && response.data.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'No Reviews !',
                                      style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff998FA2), fontSize: 12.sp, fontWeight: FontWeight.w500),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
