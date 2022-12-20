import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistants_grid_view.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchFiltersAndPersonalAssistantList extends ConsumerStatefulWidget {
  const SearchFiltersAndPersonalAssistantList({Key? key}) : super(key: key);

  @override
  SearchFiltersAndPersonalAssistantListState createState() =>
      SearchFiltersAndPersonalAssistantListState();
}

class SearchFiltersAndPersonalAssistantListState
    extends ConsumerState<SearchFiltersAndPersonalAssistantList> {
  final List<String> filters = const ['language', 'gender', 'location', 'Rate'];

  List<Color> filtersColors = [
    const Color(0xff241332).withOpacity(0.3),
    const Color(0xff241332).withOpacity(0.3),
    const Color(0xff241332).withOpacity(0.3),
    const Color(0xff241332).withOpacity(0.3)
  ];
  List<Color> circlesColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent
  ];
  final List<String> personalStars = const [
    AppImages.personalFillStar,
    AppImages.personalFillStar,
    AppImages.personalEmptyStar,
    AppImages.personalEmptyStar,
    AppImages.personalEmptyStar
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (context, ref, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: ref.watch(searchBarHeightProvider),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 48.h,
                  width: 286.w,
                  padding: EdgeInsets.only(
                    left: Sizer.w(context, 0.035),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffF8F7FE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search for ...',
                        hintStyle: AppTextStyle.appHintStyle,
                        icon: ref.watch(searchBarHeightProvider) == 48.h
                            ? const Icon(Icons.search)
                            : Container(),
                      ),
                      onChanged: (searchValue) {
                        ref
                            .watch(searchForAPersonalAssistantProvider.notifier)
                            .state = searchValue;
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<GetAssistantsCubit>(context)
                        .getAllAssistants(
                            search:
                                ref.watch(searchForAPersonalAssistantProvider));
                  },
                  child: Container(
                    height: 33.w,
                    width: 33.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 19.w,
                        width: 19.w,
                        child: SvgPicture.asset(AppImages.searchIcon),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: Sizer.h(context, 0.01)),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: Sizer.h(context, /*0.07*/ ref.watch(filterBarHeightProvider)),
          //TODO IMPLEMENTING FILTERS
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, i) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.014)),
              child: Consumer(builder: (context, ref, _) {
                return TextButton(
                  onPressed: () {
                    if (circlesColors[i] == Colors.transparent) {
                      setState(() {
                        filtersColors[i] = AppColors.primaryColor;
                        circlesColors[i] = AppColors.primaryColor;
                      });
                      if (filters[i] == 'language') {
                        BlocProvider.of<GetUsedLanguagesCubit>(context)
                            .getUsedLanguages();

                        ref.watch(showLanguagesFilterProvider.notifier).state =
                            true;
                      } else if (filters[i] == 'gender') {
                        ref.watch(showGenderFilterProvider.notifier).state =
                            true;
                      } else if (filters[i] == 'location') {
                        ref.watch(showLocationFilterProvider.notifier).state =
                            true;
                      } else {
                        ref.watch(showRateFilterProvider.notifier).state = true;
                      }
                    } else {
                      setState(() {
                        filtersColors[i] =
                            const Color(0xff241332).withOpacity(0.3);
                        circlesColors[i] = Colors.transparent;
                      });
                      if (filters[i] == 'language') {
                        ref.watch(showLanguagesFilterProvider.notifier).state =
                            false;

                        print('language is done');
                      } else if (filters[i] == 'gender') {
                        ref.watch(showGenderFilterProvider.notifier).state =
                            false;
                        print('gender is done');
                      } else if (filters[i] == 'location') {
                        ref.watch(showLocationFilterProvider.notifier).state =
                            false;
                        print('location is done');
                      } else {
                        ref.watch(showRateFilterProvider.notifier).state =
                            false;
                        print('rating is done');
                      }
                    }
                  },
                  child: SizedBox(
                    height: 35.h,
                    // width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            filters[i],
                            style: AppTextStyle.appHintStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: filtersColors[i],
                                height: 1.h),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            height: Sizer.h(context, 0.01),
                            width: Sizer.w(context, 0.03),
                            decoration: BoxDecoration(
                              color: circlesColors[i],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: Sizer.h(context, 0.015),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Most Common', style: AppTextStyle.blackMedium),
            Text(
              '',
              style: AppTextStyle.appHintStyle
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: Sizer.h(context, 0.02),
        ),

        ///This widget is the Personal Assistant List

        //  PersonalAssistantGridView()

        Consumer(builder: (context, ref, _) {
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height:
                    ref.watch(searchBarHeightProvider) == 48.h ? 470.h : 600.h,
                child: AnimationLimiter(
                  child: Consumer(
                    builder: (context, ref, _) =>
                        NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels > 50) {
                          ref.watch(filterBarHeightProvider.notifier).state = 0;
                          ref.watch(searchBarHeightProvider.notifier).state = 0;
                        } else if (notification.metrics.pixels < 300) {
                          ref.watch(filterBarHeightProvider.notifier).state =
                              0.07;
                          ref.watch(searchBarHeightProvider.notifier).state =
                              48.h;
                        }

                        return true;
                      },
                      child: BlocBuilder<GetAssistantsCubit,
                          Result<GetAssistantEntity>>(
                        builder: (context, state) => state.when(
                          () => Container(),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          initial: () => Container(),
                          error: (error, s) {
                            return Center(
                              child: Text(error!),
                            );
                          },
                          success: (response) {
                            if (response is GetAssistantEntity) {
                              return GridView.builder(
                                shrinkWrap: true,
                                controller: ref.watch(
                                    personalAssistantListScrollController),
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemCount: response.data!
                                    .length, // ref.watch(listOfPersonalAssistantsNames).length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                      duration:
                                          const Duration(milliseconds: 900),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                        child: SizedBox(
                                          height: Sizer.h(context, 0.05),
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  ref
                                                          .watch(
                                                              chosenPersonalAssistantName
                                                                  .notifier)
                                                          .state =
                                                      response.data![i].name;
                                                  ref
                                                      .watch(
                                                          chosenPersonalAssistantImage
                                                              .notifier)
                                                      .state = response.data![i]
                                                          .profile_image ??
                                                      AppImages
                                                          .placeholderImage;
                                                  ref
                                                          .watch(
                                                              chosenPersonalAssistantAboutProvider
                                                                  .notifier)
                                                          .state =
                                                      response.data![i].about;
                                                  ref
                                                      .watch(
                                                          chosenAssistantIdProvider
                                                              .notifier)
                                                      .state = response.data![i].id;
                                                  Navigator.pushNamed(context,
                                                      PERSONAL_ASSISTANT_PICKED_FROM_LIST);
                                                },
                                                child: Container(
                                                  height:
                                                      Sizer.h(context, 0.145),
                                                  width: 156.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: AppColors
                                                        .primaryColor
                                                        .withOpacity(0.3),
                                                    image: response.data![i]
                                                                .profile_image !=
                                                            null
                                                        ? DecorationImage(
                                                            image: NetworkImage(
                                                                response
                                                                    .data![i]
                                                                    .profile_image!),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : const DecorationImage(
                                                            image: AssetImage(
                                                                AppImages
                                                                    .placeholderImage),
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 12.w),
                                                        child: SizedBox(
                                                          //width:75.w,
                                                          height: 9.h,
                                                          child: /* List.generate(response.data![i].rating_avrage!.round(), (index) => Text('hil')) */

                                                              // TODO HERE IM GOING TO MAKE THE RATING FUNCTIONALITY
                                                              ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            shrinkWrap: true,
                                                            itemCount:
                                                                personalStars
                                                                    .length,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          3.w),
                                                              child: SizedBox(
                                                                width: 7.w,
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  personalStars[
                                                                      index],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: (5.1).h,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Sizer.h(context, 0.02),
                                              ),
                                              Text(
                                                response.data![i].name!
                                                /*  ref.watch(
                                                listOfPersonalAssistantsNames)[i]  */
                                                ,
                                                // getPersonalAssistantNames(),
                                                style: AppTextStyle.blackMedium
                                                    .copyWith(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container(
                                height: 100,
                                width: 100,
                                color: Colors.red,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
