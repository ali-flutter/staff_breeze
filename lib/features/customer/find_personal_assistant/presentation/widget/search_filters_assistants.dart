import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
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
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                                height: 1.h
                            ),
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

        PersonalAssistantGridView()
      ],
    );
  }
}
