import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistants_grid_view.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class SearchFiltersAndPersonalAssistantList extends StatefulWidget {
  const SearchFiltersAndPersonalAssistantList({Key? key}) : super(key: key);

  @override
  State<SearchFiltersAndPersonalAssistantList> createState() =>
      _SearchFiltersAndPersonalAssistantListState();
}

class _SearchFiltersAndPersonalAssistantListState
    extends State<SearchFiltersAndPersonalAssistantList> {
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
        Row(
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
                      icon: const Icon(Icons.search)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height:33.w,
                width:33.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: SizedBox(
                    height: 19.w,
                    width: 19.w,
                    child: SvgPicture.asset(AppImages.searchIcon),
                  )
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Sizer.h(context, 0.01)),
        SizedBox(
          height: Sizer.h(context, 0.07),
          //TODO IMPLEMENTING FILTERS
          child: ListView.builder(
            physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, i) => Padding(
              padding:
              EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.014)),
              child: TextButton(
                onPressed: () {
                  if (circlesColors[i] == Colors.transparent) {
                    setState(() {
                      filtersColors[i] = AppColors.primaryColor;
                      circlesColors[i] = AppColors.primaryColor;
                    });
                  } else {
                    setState(() {
                      filtersColors[i] =
                          const Color(0xff241332).withOpacity(0.3);
                      circlesColors[i] = Colors.transparent;
                    });
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filters[i],
                      style: AppTextStyle.appHintStyle.copyWith(
                          fontWeight: FontWeight.w500, color: filtersColors[i]),
                    ),
                    SizedBox(
                      height: Sizer.h(context, 0.005),
                    ),
                    Container(
                      height: Sizer.h(context, 0.01),
                      width: Sizer.w(context, 0.03),
                      decoration: BoxDecoration(
                        color: circlesColors[i],
                        shape: BoxShape.circle,
                      ),
                    ),
                    //
                  ],
                ),
              ),
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

        const PersonalAssistantGridView()
      ],
    );
  }


}
