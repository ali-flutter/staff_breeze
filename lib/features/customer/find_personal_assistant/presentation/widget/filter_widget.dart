import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_services_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_services_cubit.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/education_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import '../../../../../core/network_configration/result.dart';
import '../../../../../style/app_colors.dart';
import '../../../../../style/app_text_style.dart';
import '../../../../registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import '../../domain/entities/get_used_languages_entity.dart';
import '../business_logic/cubit/get_assistants_cubit.dart';
import '../business_logic/cubit/get_used_languages_cubit.dart';
import '../business_logic/statecontroller/find personal_assistant_state_controller.dart';

class FiltersWidget extends StatefulWidget {
  FiltersWidget({Key? key}) : super(key: key);

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  List genders = ['Male', 'Female'];
  List rateFilter = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars'];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          children: [
            ///LANGUAGES FILTERS
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: buildTextButton(
                      fontColor: ref.watch(showLanguagesFilterProvider) || ref.watch(selectedLanguagesList).isNotEmpty ? AppColors.primaryColor : const Color(0xff241332).withOpacity(0.3),
                      circuleColor: ref.watch(showLanguagesFilterProvider) || ref.watch(selectedLanguagesList).isNotEmpty ? AppColors.primaryColor : Colors.transparent,
                      filterName: 'Languages',
                      onPressed: () {
                        ref.watch(showLanguagesFilterProvider.notifier).state = !ref.watch(showLanguagesFilterProvider);
                        ref.watch(showRateFilterProvider.notifier).state = false;
                        ref.watch(showServicesFilterProvider.notifier).state = false;
                        ref.watch(showEducationFilterProvider.notifier).state = false;
                        ref.watch(showGenderFilterProvider.notifier).state = false;
                        ref.watch(showLocationFilterProvider.notifier).state = false;

                        if (ref.watch(showLanguagesFilterProvider)) {
                          ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                          BlocProvider.of<GetUsedLanguagesCubit>(context).getUsedLanguages();
                        } else if (ref.watch(showLanguagesFilterProvider.notifier).state == false &&
                            ref.watch(showLocationFilterProvider.notifier).state == false &&
                            ref.watch(showEducationFilterProvider.notifier).state == false &&
                            ref.watch(showGenderFilterProvider.notifier).state == false &&
                            ref.watch(showServicesFilterProvider.notifier).state == false &&
                            ref.watch(showRateFilterProvider.notifier).state == false) {
                          ref.watch(filterBarHeightProvider.notifier).state = 59.h;
                        }
                      }),
                ),
                // SizedBox(height: 0.h),
                ref.watch(showLanguagesFilterProvider)
                    ? buildFilterContainer<GetUsedLanguagesCubit, GetUsedLanguagesEntity>(
                  context: context,
                  height: 152.h,
                  width: 150.w,
                  radius: 10.r,
                  onErrorRetryFunction: () {
                    BlocProvider.of<GetUsedLanguagesCubit>(context).getUsedLanguages();
                  },
                  selectedList: ref.watch(selectedLanguagesList.notifier).state,
                )
                    : Container(),
              ],
            ),

            ///GENDERS FILTERS
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: buildTextButton(
                    fontColor: ref.watch(showGenderFilterProvider) || ref.watch(selectedGenderFilterProvider) != null ? AppColors.primaryColor : const Color(0xff241332).withOpacity(0.3),
                    circuleColor: ref.watch(showGenderFilterProvider) || ref.watch(selectedGenderFilterProvider) != null ? AppColors.primaryColor : Colors.transparent,
                    filterName: 'gender',
                    onPressed: () {
                      ref.watch(showGenderFilterProvider.notifier).state = !ref.watch(showGenderFilterProvider);
                      ref.watch(showRateFilterProvider.notifier).state = false;
                      ref.watch(showServicesFilterProvider.notifier).state = false;
                      ref.watch(showEducationFilterProvider.notifier).state = false;
                      ref.watch(showLanguagesFilterProvider.notifier).state = false;
                      ref.watch(showLocationFilterProvider.notifier).state = false;

                      if (ref.watch(showGenderFilterProvider)) {
                        ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                      } else if (ref.watch(showLanguagesFilterProvider.notifier).state == false &&
                          ref.watch(showLocationFilterProvider.notifier).state == false &&
                          ref.watch(showEducationFilterProvider.notifier).state == false &&
                          ref.watch(showGenderFilterProvider.notifier).state == false &&
                          ref.watch(showServicesFilterProvider.notifier).state == false &&
                          ref.watch(showRateFilterProvider.notifier).state == false) {
                        ref.watch(filterBarHeightProvider.notifier).state = 59.h;
                      }
                    },
                  ),
                ),
                // SizedBox(height: 10.h),
                Consumer(builder: (context, ref, _) {
                  return ref.watch(showGenderFilterProvider)
                      ? Container(
                    height: 72.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.primaryColor.withOpacity(.91),
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      children: genders
                          .map((gender) => GestureDetector(
                        onTap: () {
                          ref.watch(showGenderFilterProvider.notifier).state = false;
                        },
                        child: SizedBox(
                          width: 80.w,
                          height: 25.h,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                if (gender == 'Male') {
                                  ref.watch(selectedGenderFilterProvider.notifier).state = 1;
                                  BlocProvider.of<GetAssistantsCubit>(context)
                                      .getAllAssistants(page: 1, pageSize: 10, language: ref.watch(selectedLanguagesList), is_male: ref.watch(selectedGenderFilterProvider));
                                  ref.watch(showGenderFilterProvider.notifier).state = false;
                                } else {
                                  ref.watch(selectedGenderFilterProvider.notifier).state = 0;
                                  BlocProvider.of<GetAssistantsCubit>(context)
                                      .getAllAssistants(page: 1, pageSize: 10, language: ref.watch(selectedLanguagesList), is_male: ref.watch(selectedGenderFilterProvider));
                                  ref.watch(showGenderFilterProvider.notifier).state = false;
                                }
                                print(ref.watch(selectedGenderFilterProvider));
                              },
                              child: Center(
                                child: Text(
                                  gender,
                                  style: AppTextStyle.whiteBold.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                  )
                      : Container();
                })
              ],
            ),

            ///LOCATION FILTERS
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: buildTextButton(
                      fontColor: ref.watch(showLocationFilterProvider) || ref.watch(selectedCountryId) != null ? AppColors.primaryColor : const Color(0xff241332).withOpacity(0.3),
                      circuleColor: ref.watch(showLocationFilterProvider) || ref.watch(selectedCountryId) != null ? AppColors.primaryColor : Colors.transparent,
                      filterName: 'Location',
                      onPressed: () {
                        ref.watch(showLocationFilterProvider.notifier).state = !ref.watch(showLocationFilterProvider);
                        ref.watch(showRateFilterProvider.notifier).state = false;
                        ref.watch(showServicesFilterProvider.notifier).state = false;
                        ref.watch(showEducationFilterProvider.notifier).state = false;
                        ref.watch(showGenderFilterProvider.notifier).state = false;
                        ref.watch(showLanguagesFilterProvider.notifier).state = false;

                        if (ref.watch(showLocationFilterProvider)) {
                          ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                          BlocProvider.of<CountriesCubit>(context).getCountries();
                        } else if (ref.watch(showLanguagesFilterProvider.notifier).state == false &&
                            ref.watch(showLocationFilterProvider.notifier).state == false &&
                            ref.watch(showEducationFilterProvider.notifier).state == false &&
                            ref.watch(showGenderFilterProvider.notifier).state == false &&
                            ref.watch(showServicesFilterProvider.notifier).state == false &&
                            ref.watch(showRateFilterProvider.notifier).state == false) {
                          ref.watch(filterBarHeightProvider.notifier).state = 59.h;
                        }
                      }),
                ),
                // SizedBox(height: 10.h),
                Consumer(builder: (context, ref, _) {
                  return ref.watch(showLocationFilterProvider)
                      ?
                  /*buildFilterContainer<CountriesCubit, CountriesEntity>(
                          context: context,
                          height: 152.h,
                          width: 90.w,
                          radius: 10,
                          onErrorRetryFunction: () {},
                          selectedList:
                              ref.watch(selectedLocationList.notifier).state,
                        )*/
                  Container(
                    height: 172.h,
                    width: 159.w,
                    decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(.91), borderRadius: BorderRadius.circular(10.r)),
                    child: BlocBuilder<CountriesCubit, Result<CountriesEntity>>(
                      builder: (context, state) => state.when(
                            () => Container(),
                        loading: () => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                        initial: () => Container(),
                        error: (message, code) => Center(
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  message ?? 'Something went wrong',
                                  style: AppTextStyle.whiteBold.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Retry',
                                    style: AppTextStyle.appHintStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        success: (response) => Consumer(builder: (context, ref, _) {
                          return ListView.builder(
                            //bse
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            itemCount: response.data.length,
                            itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                //ref.watch(selectedCountryId.notifier).state = response.data[i].id;
                                if (ref.watch(selectedCountryId) != null)
                                  ref.watch(selectedCountryId.notifier).state = null;
                                else {
                                  ref.watch(selectedCountryId.notifier).state = response.data[i].id;
                                  BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(
                                      page: 1,
                                      pageSize: 10,
                                      language: ref.watch(selectedLanguagesList),
                                      education: ref.watch(selectedEducationList),
                                      services: ref.watch(selectedServicesList),
                                      country: ref.watch(selectedCountryId));
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.0.r,
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  height: 35.h,
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(horizontal: 6.r),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    // color: ref.watch(selectedRateAverage) == int.parse(rate.toString().substring(0, 1)).toDouble() ? Color(0xff515A75) : null,

                                    color: ref.watch(selectedCountryId) == response.data[i].id ? const Color(0xff515A75) : null,
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        response.data[i].name,
                                        style: AppTextStyle.whiteBold.copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        //  presetFontSizes: [8.sp,12.sp,14.sp],
                                        maxLines: 1,
                                        //stepGranularity: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                      : Container();
                })
              ],
            ),

            Column(
              children: const [],
            ),

            ///SERVICES FILTERS
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: buildTextButton(
                    fontColor: ref.watch(showServicesFilterProvider) || ref.watch(selectedServicesList).isNotEmpty ? AppColors.primaryColor : const Color(0xff241332).withOpacity(0.3),
                    circuleColor: ref.watch(showServicesFilterProvider) || ref.watch(selectedServicesList).isNotEmpty ? AppColors.primaryColor : Colors.transparent,
                    filterName: 'Services',
                    onPressed: () {
                      ref.watch(showServicesFilterProvider.notifier).state = !ref.watch(showServicesFilterProvider);
                      ref.watch(showRateFilterProvider.notifier).state = false;
                      ref.watch(showLanguagesFilterProvider.notifier).state = false;
                      ref.watch(showEducationFilterProvider.notifier).state = false;
                      ref.watch(showGenderFilterProvider.notifier).state = false;
                      ref.watch(showLocationFilterProvider.notifier).state = false;

                      if (ref.watch(showServicesFilterProvider)) {
                        ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                        BlocProvider.of<GetUsedServicesCubit>(context).getUsedServices();
                      } else if (ref.watch(showLanguagesFilterProvider.notifier).state == false &&
                          ref.watch(showLocationFilterProvider.notifier).state == false &&
                          ref.watch(showEducationFilterProvider.notifier).state == false &&
                          ref.watch(showGenderFilterProvider.notifier).state == false &&
                          ref.watch(showServicesFilterProvider.notifier).state == false &&
                          ref.watch(showRateFilterProvider.notifier).state == false) {
                        ref.watch(filterBarHeightProvider.notifier).state = 59.h;
                      }
                    },
                  ),
                ),
                // SizedBox(height: 10.h),
                ref.watch(showServicesFilterProvider)
                    ? buildFilterContainer<GetUsedServicesCubit, GetUsedServicesEntity>(
                  context: context,
                  height: 110.h,
                  width: 125.w,
                  radius: 10.r,
                  onErrorRetryFunction: () {},
                  selectedList: ref.watch(selectedServicesList.notifier).state,
                )
                    : Container()
              ],
            ),

            ///EDUCATION FILTERS
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: buildTextButton(
                      fontColor: ref.watch(showEducationFilterProvider) || ref.watch(selectedEducationList).isNotEmpty ? AppColors.primaryColor : const Color(0xff241332).withOpacity(0.3),
                      circuleColor: ref.watch(showEducationFilterProvider) || ref.watch(selectedEducationList).isNotEmpty ? AppColors.primaryColor : Colors.transparent,
                      filterName: 'Education',
                      onPressed: () {
                        ref.watch(showEducationFilterProvider.notifier).state = !ref.watch(showEducationFilterProvider);
                        ref.watch(showRateFilterProvider.notifier).state = false;
                        ref.watch(showServicesFilterProvider.notifier).state = false;
                        ref.watch(showLanguagesFilterProvider.notifier).state = false;
                        ref.watch(showGenderFilterProvider.notifier).state = false;
                        ref.watch(showLocationFilterProvider.notifier).state = false;

                        if (ref.watch(showEducationFilterProvider)) {
                          ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                          BlocProvider.of<EducationsCubit>(context).getEducations();
                        } else if (ref.watch(showLanguagesFilterProvider.notifier).state == false &&
                            ref.watch(showLocationFilterProvider.notifier).state == false &&
                            ref.watch(showEducationFilterProvider.notifier).state == false &&
                            ref.watch(showGenderFilterProvider.notifier).state == false &&
                            ref.watch(showServicesFilterProvider.notifier).state == false &&
                            ref.watch(showRateFilterProvider.notifier).state == false) {
                          ref.watch(filterBarHeightProvider.notifier).state = 59.h;
                        }
                      }),
                ),
                // SizedBox(height: 10.h),
                ref.watch(showEducationFilterProvider)
                    ? buildFilterContainer<EducationsCubit, EducationsEntity>(
                  context: context,
                  height: 150.h,
                  width: 160.w,
                  radius: 10.r,
                  onErrorRetryFunction: () {},
                  selectedList: ref.watch(selectedEducationList.notifier).state,
                )
                    : Container()
              ],
            ),

            ///RATE FILTERS
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: buildTextButton(
                      fontColor: ref.watch(showRateFilterProvider) || ref.watch(selectedRateAverage) != null ? AppColors.primaryColor : const Color(0xff241332).withOpacity(0.3),
                      circuleColor: ref.watch(showRateFilterProvider) || ref.watch(selectedRateAverage) != null ? AppColors.primaryColor : Colors.transparent,
                      filterName: 'Rate',
                      onPressed: () {
                        ref.watch(showRateFilterProvider.notifier).state = !ref.watch(showRateFilterProvider);
                        ref.watch(showLanguagesFilterProvider.notifier).state = false;
                        ref.watch(showServicesFilterProvider.notifier).state = false;
                        ref.watch(showEducationFilterProvider.notifier).state = false;
                        ref.watch(showGenderFilterProvider.notifier).state = false;
                        ref.watch(showLocationFilterProvider.notifier).state = false;

                        if (ref.watch(showRateFilterProvider)) {
                          ref.watch(filterBarHeightProvider.notifier).state = 220.h;
                        } else if (ref.watch(showLanguagesFilterProvider.notifier).state == false &&
                            ref.watch(showLocationFilterProvider.notifier).state == false &&
                            ref.watch(showEducationFilterProvider.notifier).state == false &&
                            ref.watch(showGenderFilterProvider.notifier).state == false &&
                            ref.watch(showServicesFilterProvider.notifier).state == false &&
                            ref.watch(showRateFilterProvider.notifier).state == false) {
                          ref.watch(filterBarHeightProvider.notifier).state = 59.h;
                        }
                      }),
                ),
                Consumer(builder: (context, ref, _) {
                  return ref.watch(showRateFilterProvider)
                      ? Container(
                    height: 159.h,
                    width: 90.w,
                    padding: EdgeInsets.symmetric(horizontal: 6.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.primaryColor.withOpacity(.91),
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      children: rateFilter
                          .map((rate) => GestureDetector(
                        onTap: () {
                          ref.watch(selectedRateAverage.notifier).state = int.parse(rate.toString().substring(0, 1)).toDouble();
                          print(ref.watch(selectedRateAverage));

                          BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(
                            page: 1,
                            pageSize: 10,
                            language: ref.watch(selectedLanguagesList),
                            education: ref.watch(selectedEducationList),
                            services: ref.watch(selectedServicesList),
                            country: ref.watch(selectedCountryId),
                            rating: ref.watch(selectedRateAverage),
                            is_male: ref.watch(selectedGenderFilterProvider),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ref.watch(selectedRateAverage) == int.parse(rate.toString().substring(0, 1)).toDouble() ? Color(0xff515A75) : null,
                              //color: selectedList.contains(response.data[i].id) ? const Color(0xff515A75) : null,
                              // borderRadius: i == 0 ? BorderRadius.circular(10) : BorderRadius.circular(0),
                              borderRadius: BorderRadius.circular(10.r)
                            //border: Border.symmetric(horizontal:BorderSide(color: Colors.white,width: 0.1.h))
                          ),
                          // color: ref.watch(selectedRateAverage) == int.parse(rate.toString().substring(0, 1)).toDouble() ? Color(0xff241332) : null,
                          width: 40.w,
                          height: 35.h,
                          child: Center(
                            child: Center(
                              child: Text(
                                rate,
                                style: AppTextStyle.whiteBold.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                  )
                      : Container();
                })
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget buildFilterContainer<BlocType extends StateStreamable<Result<EntityType>>, EntityType>({
    required BuildContext context,
    required double height,
    required double width,
    required double radius,
    required void Function()? onErrorRetryFunction,
    required List selectedList,
  }) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 3.r),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.91),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: BlocBuilder<BlocType, Result<EntityType>>(
        builder: (context, state) => state.when(
              () => Container(),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          initial: () => Container(),
          error: (message, code) => Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      message ?? 'Something went wrong',
                      style: AppTextStyle.whiteBold.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ElevatedButton(
                    onPressed: onErrorRetryFunction,
                    child: Text(
                      'Retry',
                      style: AppTextStyle.appHintStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          success: (response) => Consumer(builder: (context, ref, _) {
            return ListView.builder(
              //back
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: response.data.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  if (selectedList.contains(response.data[i].id)) {
                    selectedList.remove(response.data[i].id);
                    setState(() {});
                    BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(
                        page: 1,
                        pageSize: 10,
                        language: ref.watch(selectedLanguagesList),
                        education: ref.watch(selectedEducationList),
                        services: ref.watch(selectedServicesList),
                        country: ref.watch(selectedLocationFilterProvider));
                    print(selectedList);
                  } else {
                    selectedList.add(response.data[i].id);
                    print(selectedList);
                    BlocProvider.of<GetAssistantsCubit>(context).getAllAssistants(
                        page: 1,
                        pageSize: 10,
                        language: ref.watch(selectedLanguagesList),
                        education: ref.watch(selectedEducationList),
                        services: ref.watch(selectedServicesList),
                        country: ref.watch(selectedLocationFilterProvider));
                    setState(() {});
                  }
                },
                child: Container(
                  //bac
                  padding: EdgeInsets.symmetric(horizontal: 6.r),
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: selectedList.contains(response.data[i].id) ? const Color(0xff515A75) : null,
                      // borderRadius: i == 0 ? BorderRadius.circular(10) : BorderRadius.circular(0),
                      borderRadius: BorderRadius.circular(10.r)
                    //border: Border.symmetric(horizontal:BorderSide(color: Colors.white,width: 0.1.h))
                  ),
                  height: 35.h,
                  width: width,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        response.data[i].name,
                        style: AppTextStyle.whiteBold.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        //stepGranularity: 10,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget buildTextButton({required String filterName, required Color circuleColor, required Color fontColor, required void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            filterName,
            style: AppTextStyle.appHintStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: fontColor, height: 1.h),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 10.w,
            width: 10.w,
            decoration: BoxDecoration(
              color: circuleColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
