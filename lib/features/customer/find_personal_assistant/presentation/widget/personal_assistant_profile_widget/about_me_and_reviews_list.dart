import 'dart:math' as math;
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/expandable_card_widget.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import '../../business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import '../../../../../../style/dimensions_controller.dart';

class AboutMeReviewsList extends ConsumerStatefulWidget {
  const AboutMeReviewsList({super.key});

  @override
  AboutMeReviewsListState createState() => AboutMeReviewsListState();
}

class AboutMeReviewsListState extends ConsumerState<AboutMeReviewsList> {
  @override
  void initState() {

    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    BlocProvider.of<GetReviewsCubit>(context)
        .getReviews(assistantId: ref.watch(chosenAssistantIdProvider)!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsCubit, Result<GetReviewsEntity>>(
      builder: (context, state) => state.when(() => Container(),
          loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          initial: () => Container(),
          error: (error, s) => Center(
                child: Text(
                  error!,
                  style: AppTextStyle.whiteBold
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
              ),
          success: (response) {
            if (response is GetReviewsEntity && response.data.isNotEmpty) {

               return ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: response.data.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: ExpandableCard(
                      body: response.data[i].body,
                      image: imagesUrl+response.data[i].clientProfileImage,
                      name: response.data[i].clientName,
                      reviewsTime: response.data[i].createdAt,
                        ratingAverage: response.data[i].rating,
                    )
                  );
                },
              );
            } else {
              return Center(
                child: Text('No Reviews!',style: AppTextStyle.appHintStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              );
            }
          }),
    );
  }

}
