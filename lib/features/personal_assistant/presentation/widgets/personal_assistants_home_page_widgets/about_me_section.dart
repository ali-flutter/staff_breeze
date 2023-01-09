import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/add_languages_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/personal_assistants_home_page_widgets/edit_about_section.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import '../../../../../core/common_widgets/app_buttons.dart';
import '../../../../../core/network_configration/result.dart';
import '../../../../../style/app_text_style.dart';
import '../../../domain/entity/perosnal_assistant_home_page_entity.dart';
import '../../business_logic/controller/personal_assistant_home_page_state_controller.dart';
import '../../business_logic/cubit/personal_assistant_home_page_cubit.dart';
/*
import '../../business_logic/cubit/personal_assistant_home_page_cubit.dart';
*/

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        upperBound: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: ref.watch(isAboutMeSectionExpanded) == false
            ? ref.watch(notExpandedAboutSectionHeight)
            : ref.watch(aboutMeHeight),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
            ),
            color: Color(0xff423050)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsetsDirectional.only(
              start: (0.5).w, end: 0, bottom: (1.5).h),
          height: ref.watch(isAboutMeSectionExpanded) == false
              ? ref.watch(notExpandedAboutSectionHeight)
              : ref.watch(aboutMeHeight),
          decoration: const BoxDecoration(
            color: Color(0xff181928),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
          ),
          child: SizedBox(
            // height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: ref.watch(isAboutMeSectionExpanded) ? 21.h : 39.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 38.5.w),
                    Text(
                      'About Me',
                      style: AppTextStyle.whiteBold
                          .copyWith(fontSize: 16.sp, height: 1.h),
                    ),
                    SizedBox(width: 140.w),
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                      child: IconButton(
                        onPressed: () {
                          if (ref.watch(isAboutMeSectionExpanded)) {
                            controller.reverse(from: 0.5);
                            ref
                                .watch(notificationScheduleHeight.notifier)
                                .state = 130.h;
                          } else {
                            controller.forward(from: 0.0);
                            ref
                                .watch(notificationScheduleHeight.notifier)
                                .state = 0.h;
                          }
                          ref.watch(isAboutMeSectionExpanded.notifier).state =
                              !ref.watch(isAboutMeSectionExpanded);
                          ref.watch(aboutMePenIsTapped.notifier).state = false;
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.watch(aboutMePenIsTapped.notifier).state =
                            !ref.watch(aboutMePenIsTapped);
                        if (ref.watch(isAboutMeSectionExpanded)) {
                          ref.watch(notificationScheduleHeight.notifier).state =
                              130.h;
                          controller.reverse(from: 0.5);
                          //  ref.watch(notExpandedAboutSectionHeight.notifier).state = 130.h;
                        } else {
                          ref.watch(notificationScheduleHeight.notifier).state =
                              0;
                          ref.watch(aboutMeHeight.notifier).state = 470.h;
                          controller.forward(from: 0.0);
                        }

                        ref.watch(isAboutMeSectionExpanded.notifier).state =
                            !ref.watch(isAboutMeSectionExpanded);
                      },
                      child: SizedBox(
                        height: 27.w,
                        width: 27.w,
                        child: SvgPicture.asset(
                          'assets/images/edit.svg',
                        ),
                      ),
                    ),
                  ],
                ),
                ref.watch(isAboutMeSectionExpanded) == true
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: ref.watch(aboutMePenIsTapped) ? 5.w : 36.w,
                            right: 11.w),
                        child: SizedBox(
                          //the shity hight i always search to edit``

                          height: ref.watch(aboutMePenIsTapped) ? 400.h : null,
                          child: !ref.watch(aboutMePenIsTapped)
                              ? BlocBuilder<PersonalAssistantHomePageCubit,
                                  Result<PersonalAssistantHomePageEntity>>(
                                  builder: (context, state) => state.when(
                                      () => Container(),
                                      loading: () => Padding(
                                            padding:
                                                EdgeInsets.only(right: 40.w),
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                      initial: () => Container(),
                                      error: (error, s) => Center(
                                            child: Text(
                                              error!,
                                              style: AppTextStyle.ironExtraBig
                                                  .copyWith(
                                                color: const Color(0xff998FA2),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                      success: (response) {
                                        if (response
                                            is PersonalAssistantHomePageEntity) {
                                          return MediaQuery.removePadding(
                                            context: context,
                                            removeTop: false,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  SizedBox(
                                                    // height: 80.h,
                                                    //width: MediaQuery.of(context).size.width * 0.8,
                                                    child: Text(
                                                      response.data.about ?? '',
                                                      // textAlign: TextAlign.start,
                                                      style: AppTextStyle
                                                          .ironExtraBig
                                                          .copyWith(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      210,
                                                                      206,
                                                                      213),
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 1.3),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  Row(
                                                    children: [
                                                      SectionTitle(
                                                          title: 'Address'),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      SizedBox(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 13),
                                                          child: Text(
                                                            response
                                                                    .data
                                                                    .country
                                                                    .isEmpty
                                                                ? 'No Country'
                                                                : response
                                                                    .data
                                                                    .country
                                                                    .first
                                                                    .title,
                                                            style: AppTextStyle
                                                                .appHintStyle
                                                                .copyWith(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            210,
                                                                            206,
                                                                            213),
                                                                    fontSize:
                                                                        12.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      response.data.city.isEmpty
                                                          ? Container()
                                                          : Text(
                                                              '- ',
                                                              style: AppTextStyle.appHintStyle.copyWith(
                                                                  color:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          210,
                                                                          206,
                                                                          213),
                                                                  fontSize:
                                                                      12.5.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                      SizedBox(
                                                        child: Text(
                                                          response.data.city
                                                                  .isEmpty
                                                              ? 'No City'
                                                              : response
                                                                  .data
                                                                  .city
                                                                  .first
                                                                  .title
                                                                  .toString(),
                                                          style: AppTextStyle
                                                              .appHintStyle
                                                              .copyWith(
                                                                  color:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          210,
                                                                          206,
                                                                          213),
                                                                  fontSize:
                                                                      12.5.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SectionTitle(
                                                          title: 'Gender'),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      SizedBox(
                                                        height: 40.h,
                                                        width: 90.w,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 13),
                                                          child: Text(
                                                            response.data
                                                                        .is_male ==
                                                                    1
                                                                ? " Male"
                                                                : 'Female',
                                                            style: AppTextStyle
                                                                .ironExtraBig
                                                                .copyWith(
                                                              color: const Color
                                                                  .fromARGB(
                                                                      255,
                                                                      210,
                                                                      206,
                                                                      213),
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  SizedBox(
                                                    // height: 100.h /*educationListHeight(response.data.educations!.length)*/,
                                                    child: Row(
                                                      children: [
                                                       const SectionTitle(
                                                            title: 'Education'),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),

                                                        Text(
                                                          response
                                                                  .data
                                                                  .educations!
                                                                  .isEmpty
                                                              ? 'No Educations'
                                                              : response
                                                                  .data
                                                                  .educations!
                                                                  .first
                                                                  .title,
                                                          style: AppTextStyle
                                                              .appHintStyle
                                                              .copyWith(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      210,
                                                                      206,
                                                                      213),
                                                                  fontSize:
                                                                      12.5.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  SizedBox(
                                                    height: 40.h,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        SectionTitle(
                                                            title: 'Services'),
                                                        SizedBox(width: 10.w),
                                                        SizedBox(
                                                          height: 40.h,
                                                          width: 220.w,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        13.h),
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  response
                                                                      .data
                                                                      .services!
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          i) =>
                                                                      Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2.w),
                                                                child: Text(
                                                                  response
                                                                      .data
                                                                      .services![
                                                                          i]
                                                                      .title
                                                                      .toString(),
                                                                  style: AppTextStyle.appHintStyle.copyWith(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          210,
                                                                          206,
                                                                          213),
                                                                      fontSize:
                                                                          12.5
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        /* Wrap(
                                                                children: response.data.languages!
                                                                    .map((e) => Text(
                                                                          e.toString().substring(0, 1).toUpperCase() + e.toString().substring(1).toLowerCase() + '${(e == ref.watch(languages).last) ? "" : " - "}',
                                                                          style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff998FA2), fontSize: 12.sp, fontWeight: FontWeight.w500),
                                                                        ))
                                                                    .toList(),
                                                              ) */
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  SizedBox(
                                                    height: 40.h,
                                                    child: Row(
                                                      children: [
                                                        SectionTitle(
                                                            title: 'Languages'),
                                                        SizedBox(width: 10.w),
                                                        SizedBox(
                                                          height: 40.h,
                                                          width: 90.w,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        13.h),
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount: response
                                                                  .data
                                                                  .languages!
                                                                  .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          i) =>
                                                                      Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2.w),
                                                                child: Text(
                                                                  response
                                                                      .data
                                                                      .languages![
                                                                          i]
                                                                      .title
                                                                      .toString(),
                                                                  style: AppTextStyle.appHintStyle.copyWith(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          210,
                                                                          206,
                                                                          213),
                                                                      fontSize:
                                                                          12.5
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        /* Wrap(
                                                                children: response.data.languages!
                                                                    .map((e) => Text(
                                                                          e.toString().substring(0, 1).toUpperCase() + e.toString().substring(1).toLowerCase() + '${(e == ref.watch(languages).last) ? "" : " - "}',
                                                                          style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff998FA2), fontSize: 12.sp, fontWeight: FontWeight.w500),
                                                                        ))
                                                                    .toList(),
                                                              ) */
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            'Something went wrong!',
                                            style: AppTextStyle.ironExtraBig
                                                .copyWith(
                                              color: const Color(0xff998FA2),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          );
                                        }
                                      }),
                                )

                              //! edit about widget
                              : MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (context) =>
                                          getIt<AllLanguagesCubit>()
                                            ..getAllLanguages(),
                                    ),
                                    BlocProvider(
                                      create: (context) =>
                                          getIt<EducationsCubit>()
                                            ..getEducations(),
                                    ),
                                    BlocProvider(
                                      create: (context) =>
                                          getIt<CountriesCubit>()
                                            ..getCountries(),
                                    ),
                                    BlocProvider(
                                      create: (context) =>
                                          getIt<AddLanguagesCubit>(),
                                    ),
                                  ],
                                  child: EditAboutSection(),
                                ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white.withOpacity(.1)),
      child: Text(
        title,
        style: AppTextStyle.ironExtraBig.copyWith(
          color: Color.fromARGB(255, 210, 206, 213),
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
