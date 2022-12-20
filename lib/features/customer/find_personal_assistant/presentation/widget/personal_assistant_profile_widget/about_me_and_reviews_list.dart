import 'dart:math' as math;
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/reviews_item.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import '../../../../../personal_assistant/presentation/widgets/reviews_item.dart';
import '../../business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import '../../../../../../style/dimensions_controller.dart';

class AboutMeReviewsList extends ConsumerStatefulWidget {
  const AboutMeReviewsList({super.key});

  @override
  AboutMeReviewsListState createState() => AboutMeReviewsListState();
}

class AboutMeReviewsListState extends ConsumerState<AboutMeReviewsList> {
  //List<bool> trailingsBoolean = [];

  @override
  void didChangeDependencies() {
    BlocProvider.of<GetReviewsCubit>(context)
        .getReviews(assistantId: ref.watch(chosenAssistantIdProvider)!);

    super.didChangeDependencies();
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
            //TODO HERE IM STUCK ON HOW TO GET THE LENGTH OF THE LIST COMING FROM THE GET REVIEWS HTTP REQUEST AND TO UPDATE ONE ELEM
            if (response is GetReviewsEntity && response.data.isNotEmpty) {
            //  print(ref.watch(reviewItemGeneratedListOfBooleans));
              /*  /*  WidgetsBinding.instance.addPersistentFrameCallback((_) {
                  ref.watch(reviewItemGeneratedListOfBooleans.notifier).state =
                  List.filled(response.data.length, false);
              }); */
              // */
              //trailingsBoolean = List.filled(response.data.length, false);
              //  print(trailingsBoolean);
              return ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: response.data.length,
                itemBuilder: (context, i) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    ref
                        .watch(reviewItemGeneratedListOfBooleans.notifier)
                        .state = List.generate(response.data.length, ((index) {
                      if (ref.watch(reviewsItemListLength) == i) {
                        return true;
                      }
                      return false;
                    }));
                  });
                  /*   WidgetsBinding.instance.addPersistentFrameCallback((_) {
                  ref.watch(reviewItemGeneratedListOfBooleans.notifier).state =
                  List.filled(response.data.length, false);
              });  */
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: ReviewItem(
                        image: response
                            .data[i].clientProfileImage, //reviewersImages()[i],
                        reviewerName: response.data[i].clientName,
                        reviewsContent: response.data[i].body,
                        trailing: IconButton(
                          icon: ref.watch(reviewItemGeneratedListOfBooleans)[i]
                              ? const Icon(Icons.keyboard_arrow_down_sharp)
                              : const Icon(Icons.keyboard_arrow_up_sharp),
                          onPressed: () {
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            print('//////////////////////');
                            ref.watch(reviewsItemListLength.notifier).state = i;

                            ref
                                    .watch(reviewItemGeneratedListOfBooleans
                                        .notifier)
                                    .state[i] =
                                !ref
                                    .watch(reviewItemGeneratedListOfBooleans
                                        .notifier)
                                    .state[i];

                            /* setState(() {
                              trailingsBoolean[i] = !trailingsBoolean[i];
                            }); */
                          },
                        ),
                        createdAt: response.data[i].createdAt,
                        /*  IconButton(
                            onPressed: () {
                              setState(() {
                                if (trailings[i] ==
                                    Icons.keyboard_arrow_down_rounded) {
                                  trailings[i] =
                                      Icons.keyboard_arrow_up_rounded;
                                } else {
                                  trailings[i] =
                                      Icons.keyboard_arrow_down_rounded;
                                }
                                expanders[i] = !expanders[i];
                              });
                            },
                            icon: Icon(
                              trailings[i],
                              color: const Color(0xff707070),
                              size: 28.sp,
                            ),
                          ), */
                        height: ref.watch(reviewItemGeneratedListOfBooleans)[i]
                            ? 237.h
                            : 130.h,
                        expandingBoolean:
                            ref.watch(reviewItemGeneratedListOfBooleans)[i]),
                  );
                },
              );
            } else {
              return Container(
                height: 100.h,
                width: 100.w,
                color: Colors.red,
              );
            }
          }),
    );
  }

  List getReviewrName() {
    List names = [
      'Renato Sanchez',
      'Alex Montari',
      'Remy San',
      'Diego Font',
      'Roman Star'
    ];
    return names;
  }
/*List reviewersImages(){
    List images=[AppImages.blueGirl,AppImages.pinkeyGirl,AppImages.reviewer_one,AppImages.reviewer_four,AppImages.yellowMan,];
    return images;
}*/
}
/*  ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: ReviewItem(
                  image: AppImages.reviewer_one, //reviewersImages()[i],
                  reviewerName: getReviewrName()[i],
                  reviewsContent: '                    He is so good',
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        if (trailings[i] == Icons.keyboard_arrow_down_rounded) {
                          trailings[i] = Icons.keyboard_arrow_up_rounded;
                        } else {
                          trailings[i] = Icons.keyboard_arrow_down_rounded;
                        }
                        expanders[i] = !expanders[i];
                      });
                    },
                    icon: Icon(
                      trailings[i],
                      color: const Color(0xff707070),
                      size: 28.sp,
                    ),
                  ),
                  height: expanders[i] ? 237.h : 130.h,
                  expandingBoolean: expanders[i]),
            );
          },
        ); */

        /* ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: response.data!.lenght ?? 0,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: ReviewItem(
                  image: response
                      .data[i].client_profile_image, //reviewersImages()[i],
                  reviewerName: response.data[i].client_name,
                  reviewsContent: response.data[i].body,
                  trailing: SizedBox(),
                  /*  IconButton(
                            onPressed: () {
                              setState(() {
                                if (trailings[i] ==
                                    Icons.keyboard_arrow_down_rounded) {
                                  trailings[i] =
                                      Icons.keyboard_arrow_up_rounded;
                                } else {
                                  trailings[i] =
                                      Icons.keyboard_arrow_down_rounded;
                                }
                                expanders[i] = !expanders[i];
                              });
                            },
                            icon: Icon(
                              trailings[i],
                              color: const Color(0xff707070),
                              size: 28.sp,
                            ),
                          ), */
                  height: false /* expanders[i] */ ? 237.h : 130.h,
                  expandingBoolean: false /* expanders[i] */),
            );
          },
        ), */