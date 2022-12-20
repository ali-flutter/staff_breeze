import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_languages_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/customer_info_bar.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistants_grid_view.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/search_filters_assistants.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/pages/personal_assistant_home_page.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../../router/app_routes.dart';
import '../widget/customer_drawer.dart';

class FindPersonalAssistant extends StatefulWidget {
  const FindPersonalAssistant({Key? key}) : super(key: key);

  State<FindPersonalAssistant> createState() => _FindPersonalAssistantState();
}

@override
class _FindPersonalAssistantState extends State<FindPersonalAssistant> {
  List<String> languages = [
    'English',
    'French',
    'Arabic',
    'Turkish',
    'Spanish',
    'Italian'
  ];
  List<String> genders = ['Male', 'Female'];
  List<String> location = [
    'UAE',
    'Lebanon',
    'Syria',
    'Jordan',
    'Germany',
    'France',
    'Netherlands',
    'Belgium'
  ];
  List<String> rate = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Star'];
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const CustomerDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: FocusScope.of(context).hasPrimaryFocus,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(CUSTOMER_PROFILE);
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
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        color: AppColors.scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 35.h,
        ),
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, _) {
          return Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.04)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Sizer.h(context, 0.05),
                      ),
                      CustomerInfoBar(
                        onPressed: () {
                          _key.currentState!.openDrawer();
                        },
                      ),
                      ref.watch(searchBarHeightProvider) == 48.h
                          ? SizedBox(
                              height: Sizer.h(context, 0.03),
                            )
                          : SizedBox(
                              height: Sizer.h(context, 0.01),
                            ),
                      const SearchFiltersAndPersonalAssistantList()
                      //  PersonalAssistantGridView(),
                    ],
                  ),
                ),
              ),

              //languages filter
              ref.watch(showLanguagesFilterProvider)
                  ? Column(
                      children: [
                        SizedBox(height: Sizer.h(context, 0.265)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: Sizer.w(context, 0.05),
                            ),
                            Container(
                              height: 152.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primaryColor.withOpacity(.91),
                              ),
                              child: BlocBuilder<GetUsedLanguagesCubit,
                                  Result<GetUsedLanguagesEntity>>(
                                builder: (context, state) => state.when(
                                  () => Container(),
                                  loading: () => const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                                  initial: () => Container(),
                                  error: (message, code) => Center(
                                    child: Text(
                                      message ?? 'Something went wrong',
                                      style: AppTextStyle.whiteBold.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  success: (response) => ListView.builder(
                                    itemCount: response.data.length,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    itemBuilder: (context, i) => Center(
                                      child: InkWell(
                                        onTap: () {
                                          if (ref.watch(
                                                  selectedLanguageFilterProvider) ==
                                              response.data[i].id) {
                                            print('je');
                                            ref
                                                .watch(
                                                    selectedLanguageFilterProvider
                                                        .notifier)
                                                .state = null;
                                            BlocProvider.of<GetAssistantsCubit>(
                                                    context)
                                                .getAllAssistants(
                                                    language: ref.watch(
                                                        selectedLanguageFilterProvider,
                                                        ),
                                                        is_male:ref.watch(selectedGenderFilterProvider) ,
                                                        );
                                            /*  ref
                                                .watch(
                                                    showLanguagesFilterProvider
                                                        .notifier)
                                                .state = false; */
                                          } else {
                                            ref
                                                .watch(
                                                    selectedLanguageFilterProvider
                                                        .notifier)
                                                .state = response.data[i].id;
                                            print(ref.watch(
                                                selectedLanguageFilterProvider));
                                            BlocProvider.of<GetAssistantsCubit>(
                                                    context)
                                                .getAllAssistants(
                                                    language: ref.watch(
                                                        selectedLanguageFilterProvider),
                                                        is_male:ref.watch(selectedGenderFilterProvider) ,);
                                            ref
                                                .watch(
                                                    showLanguagesFilterProvider
                                                        .notifier)
                                                .state = false;
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h),
                                          child: Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                color: ref.watch(
                                                            selectedLanguageFilterProvider) ==
                                                        response.data[i].id
                                                    ? const Color(0xff5F6998)
                                                    : null,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                response.data[i].name,
                                                style: AppTextStyle.whiteBold
                                                    .copyWith(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(),

              //Genders filter
              ref.watch(showGenderFilterProvider)
                  ? Column(
                      children: [
                        SizedBox(height: Sizer.h(context, 0.265)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 120.w,
                            ),
                            Container(
                              height: 52.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primaryColor.withOpacity(.91),
                              ),
                              child: ListView(
                                physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics(),
                                ),
                                children: genders
                                    .map((gender) => GestureDetector(
                                          onTap: () {
                                            ref
                                                .watch(showGenderFilterProvider
                                                    .notifier)
                                                .state = false;
                                          },
                                          child: SizedBox(
                                            width: 80.w,
                                            height: 25.h,
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  if (gender == 'Male') {
                                                    ref
                                                        .watch(
                                                            selectedGenderFilterProvider
                                                                .notifier)
                                                        .state = 1;
                                                    BlocProvider.of<
                                                                GetAssistantsCubit>(
                                                            context)
                                                        .getAllAssistants(
                                                            language: ref.watch(
                                                                selectedLanguageFilterProvider),
                                                            is_male: ref.watch(
                                                                selectedGenderFilterProvider));
                                                    ref
                                                        .watch(
                                                            showGenderFilterProvider
                                                                .notifier)
                                                        .state = false;
                                                  } else {
                                                    ref
                                                        .watch(
                                                            selectedGenderFilterProvider
                                                                .notifier)
                                                        .state = 0;
                                                    BlocProvider.of<
                                                                GetAssistantsCubit>(
                                                            context)
                                                        .getAllAssistants(
                                                            language: ref.watch(
                                                                selectedLanguageFilterProvider),
                                                            is_male: ref.watch(
                                                                selectedGenderFilterProvider));
                                                                ref
                                                        .watch(
                                                            showGenderFilterProvider
                                                                .notifier)
                                                        .state = false;
                                                  }
                                                  print(ref.watch(
                                                      selectedGenderFilterProvider));
                                                },
                                                child: Center(
                                                  child: Text(
                                                    gender,
                                                    style: AppTextStyle
                                                        .whiteBold
                                                        .copyWith(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(),

              // location filter
              ref.watch(showLocationFilterProvider)
                  ? Column(
                      children: [
                        SizedBox(height: Sizer.h(context, 0.265)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: Sizer.w(context, 0.55),
                            ),
                            Container(
                              height: 152.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primaryColor.withOpacity(.91),
                              ),
                              child: ListView(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: location
                                    .map((loca) => GestureDetector(
                                          onTap: () {
                                            ref
                                                .watch(
                                                    showLocationFilterProvider
                                                        .notifier)
                                                .state = false;
                                          },
                                          child: SizedBox(
                                            width: 100.w,
                                            height: 30.h,
                                            child: Center(
                                              child: Text(
                                                loca,
                                                style: AppTextStyle.whiteBold
                                                    .copyWith(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(),

              // Rate filter
              ref.watch(showRateFilterProvider)
                  ? Column(
                      children: [
                        SizedBox(height: Sizer.h(context, 0.265)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: Sizer.w(context, 0.75),
                            ),
                            Container(
                              height: 152.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primaryColor.withOpacity(.91),
                              ),
                              child: ListView(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: rate
                                    .map((rate) => GestureDetector(
                                          onTap: () {
                                            ref
                                                .watch(showRateFilterProvider
                                                    .notifier)
                                                .state = false;
                                          },
                                          child: SizedBox(
                                            width: 100.w,
                                            height: 30.h,
                                            child: Center(
                                              child: Text(
                                                rate,
                                                style: AppTextStyle.whiteBold
                                                    .copyWith(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(),
            ],
          );
        }),
      ),
    );
  }
}
