import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_services_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../core/network_configration/base_network_config.dart';
import '../../domain/entities/get_used_languages_entity.dart';
import 'filter_widget.dart';

class SearchFiltersAndPersonalAssistantList extends ConsumerStatefulWidget {
  const SearchFiltersAndPersonalAssistantList({Key? key}) : super(key: key);

  @override
  SearchFiltersAndPersonalAssistantListState createState() => SearchFiltersAndPersonalAssistantListState();
}

class SearchFiltersAndPersonalAssistantListState extends ConsumerState<SearchFiltersAndPersonalAssistantList> {
/*
  int page = 1;
  int pageSize = 10;
  bool isTheFirstTime = false;
  bool hasNextPage = true;
  bool isLoadMoreRunning = false;
  void _loadMore() async {
    if (hasNextPage && isTheFirstTime == false && isLoadMoreRunning == false) {
      setState(() {
        isLoadMoreRunning = true;
      });
      page += 1;
      setState(() {
        BlocProvider.of<GetAssistantsCubit>(context)
          .getAllAssistants(page: page, pageSize: pageSize);
      });
             setState((){
               assistants.add(BlocProvider.of<GetAssistantsCubit>(context)
                   .getAllAssistants(page: page, pageSize: pageSize));
             });
      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }
  ScrollController controller= ScrollController();
  List assistants = [];
*/

/*
  void firstLoad() async {
    setState(() {
      isTheFirstTime = true;
    });
    setState(() {
      assistants.add(BlocProvider.of<GetAssistantsCubit>(context)
          .getAllAssistants(page: page, pageSize: pageSize));
    });

    setState(() {
      isTheFirstTime = false;
    });
  }
*/

  @override
  void initState() {
    BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(page: 1, pageSize: 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.watch(showLanguagesFilterProvider.notifier).state = false;
        ref.watch(showLocationFilterProvider.notifier).state = false;
        ref.watch(showEducationFilterProvider.notifier).state = false;
        ref.watch(showGenderFilterProvider.notifier).state = false;
        ref.watch(showServicesFilterProvider.notifier).state = false;
        ref.watch(showRateFilterProvider.notifier).state = false;
        ref.watch(filterBarHeightProvider.notifier).state = 59.h;
      },
      child: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(duration: const Duration(milliseconds: 200), height: ref.watch(listOfPersonalDistanseFromTop)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Common', style: AppTextStyle.blackMedium),
                  Consumer(builder: (context, ref, _) {
                    return ElevatedButton(
                        onPressed: () {
                          ref.watch(selectedLanguagesList.notifier).state.clear();
                          ref.watch(selectedEducationList.notifier).state.clear();
                          ref.watch(selectedCountryId.notifier).state = null;
                          ref.watch(selectedGenderFilterProvider.notifier).state = null;
                          ref.watch(selectedRateAverage.notifier).state = null;
                          ref.watch(selectedLocationFilterProvider.notifier).state = null;
                          ref.watch(selectedServicesList.notifier).state.clear();
                          BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(
                            page: 1,
                            pageSize: 10,
                          );
                        },
                        child: const Text('clear filters'));
                  }),
                ],
              ),
              SizedBox(height: Sizer.h(context, 0.02)),
              Consumer(builder: (context, ref, _) {
                return Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: ref.watch(searchBarHeightProvider) == 48.h ? 455.h : 570.h,
                      child: AnimationLimiter(
                        child: Consumer(
                          builder: (context, ref, _) => NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                if (notification.metrics.pixels > 50) {
                                  ref.watch(filterBarHeightProvider.notifier).state = 0;
                                  ref.watch(searchBarHeightProvider.notifier).state = 0;
                                  ref.watch(listOfPersonalDistanseFromTop.notifier).state = 20.h;
                                } else if (notification.metrics.pixels < 300) {
                                  ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                                  ref.watch(searchBarHeightProvider.notifier).state = 48.h;
                                  ref.watch(listOfPersonalDistanseFromTop.notifier).state = 120.h;
                                }

                                return true;
                              },
                              child: BlocBuilder<GetAssistantsCubit, Result<GetAssistantEntity>>(
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
                                    if (response is GetAssistantEntity && response.data!.isNotEmpty) {
                                      return GridView.builder(
                                        shrinkWrap: true,
                                        controller: ref.watch(personalAssistantListScrollController),
                                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                        itemCount: response.data!.length,
                                        // ref.watch(listOfPersonalAssistantsNames).length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                              duration: const Duration(milliseconds: 900),
                                              curve: Curves.fastLinearToSlowEaseIn,
                                              child: FadeInAnimation(
                                                child: SizedBox(
                                                  height: Sizer.h(context, 0.05),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          ref.watch(chosenPersonalAssistantName.notifier).state = response.data![i].name;
                                                          ref.watch(chosenPersonalAssistantImage.notifier).state = response.data![i].profile_image ?? AppImages.placeholderImage;
                                                          ref.watch(chosenPersonalAssistantAboutProvider.notifier).state = response.data![i].about;
                                                          ref.watch(chosenAssistantIdProvider.notifier).state = response.data![i].id;
                                                          ref.watch(chosenPersonalAssistantCountry.notifier).state = response.data![i].country;
                                                          ref.watch(chosenPersonalAssistantEducation.notifier).state = response.data![i].education;
                                                          ref.watch(chosenPersonalAssistantLanguagesList.notifier).state = response.data![i].languages;
                                                          ref.watch(chosenPersonalAssistantRatingAvrage.notifier).state = response.data![i].rating_avrage;

                                                          Navigator.pushNamed(context, PERSONAL_ASSISTANT_PICKED_FROM_LIST);
                                                        },
                                                        child: Container(
                                                          height: Sizer.h(context, 0.145),
                                                          width: 156.w,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            color: AppColors.primaryColor.withOpacity(0.3),
                                                            image: response.data![i].profile_image != null
                                                                ? DecorationImage(
                                                                image: NetworkImage(imagesUrl + response.data![i].profile_image!),
                                                                fit: BoxFit
                                                                    .cover) /*DecorationImage( image:NetworkImage(imagesUrl +response.data![i].profile_image!),
                                                                    fit: BoxFit.cover,
                                                                  )*/
                                                                : const DecorationImage(
                                                              image: AssetImage(AppImages.placeholderImage),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(left: 2.w),
                                                                child: SizedBox(
                                                                  child: IgnorePointer(
                                                                    ignoring: true,
                                                                    child: RatingBar(
                                                                      itemSize: 11.5.h,
                                                                      initialRating: response.data![i].rating_avrage ?? 0.0,
                                                                      direction: Axis.horizontal,
                                                                      itemCount: 5,
                                                                      maxRating: 5,
                                                                      allowHalfRating: true,
                                                                      ratingWidget: RatingWidget(
                                                                        empty: SizedBox(height: 16.h, width: 13.w, child: SvgPicture.asset(AppImages.personalEmptyStar)),
                                                                        full: SizedBox(height: 16.h, width: 13.w, child: SvgPicture.asset(AppImages.personalFillStar)),
                                                                        half: SizedBox(height: 16.h, width: 13.w, child: SvgPicture.asset(AppImages.personalEmptyStar)),
                                                                      ),
                                                                      onRatingUpdate: (value) {
                                                                        print(value);
                                                                      },
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
                                                        style: AppTextStyle.blackMedium.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else if (response is GetAssistantEntity && response.data!.isEmpty) {
                                      return Center(
                                        child: Text(
                                          'No Assistant found!',
                                          style: AppTextStyle.appHintStyle.copyWith(color: AppColors.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
                                        ),
                                      );
                                    } else {
                                      return Center(
                                          child: Text(
                                            'Something went wrong',
                                            style: AppTextStyle.appHintStyle.copyWith(color: AppColors.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
                                          ));
                                    }
                                  },
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
          Column(
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
                              icon: ref.watch(searchBarHeightProvider) == 48.h ? const Icon(Icons.search) : Container(),
                            ),
                            onChanged: (searchValue) {
                              ref.watch(searchForAPersonalAssistantProvider.notifier).state = searchValue;
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(pageSize: 100, page: 1, search: ref.watch(searchForAPersonalAssistantProvider));
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
              Consumer(builder: (context, ref, _) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 00),
                  height: ref.watch(filterBarHeightProvider),
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt<CountriesCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<EducationsCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<GetUsedServicesCubit>(),
                      ),
                    ],
                    child: FiltersWidget(),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
