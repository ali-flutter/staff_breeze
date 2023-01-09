import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:multiselect/multiselect.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/add_languages_entity.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/personal_assistant_home_page_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/pages/personal_assistant_home_page.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/education_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';

import '../../../../../core/common_widgets/app_buttons.dart';
import '../../../../../core/network_configration/result.dart';
import '../../../../../injection_container/injection.dart';
import '../../../../../style/app_colors.dart';
import '../../../../../style/app_text_style.dart';
import '../../../../registration/presentation/business_logic/controller/complete_registration_state_controller.dart';
import '../../business_logic/controller/personal_assistant_home_page_state_controller.dart';
import '../../business_logic/cubit/add_languages_cubit.dart';

class EditAboutSection extends StatefulWidget {
  EditAboutSection({super.key});

  @override
  State<EditAboutSection> createState() => _EditAboutSectionState();
}

class _EditAboutSectionState extends State<EditAboutSection> {
  ScrollController scrollController = ScrollController();
  late int userId;
  late String bearer;

  @override
  void initState() {
    getUserId().then((value) => userId = value ?? 0);
    bearerTokenRetreiver().then((value) => bearer = value ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: ListView(
          //controller: scrollController,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 10.h),
            // about me
            Card(
              color: const Color(0xff181928),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              elevation: 0,
              child: Container(
                color: const Color(0xff181928),
                height: 75.h,
                //  width: 287.w,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Consumer(builder: (context, ref, _) {
                      return TextFormField(
                        textInputAction: TextInputAction.newline,
                        style: const TextStyle(
                          color: Color(
                            0xff998FA2,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          focusedBorder:const UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'tell us a about you',
                          hintStyle:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                          border:const UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        onChanged: (value) {
                          ref.watch(aboutMeProvider.notifier).state = value;
                        },
                      );
                    }),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            /////////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////// EDUCATION //////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                ref.watch(showEDITeducationList.notifier).state =
                    !ref.watch(showEDITeducationList);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 200.w,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ref
                                  .watch(selectedEDITEducationNamesList)
                                  .isEmpty
                              ? Text(
                                  'Education',
                                  style: TextStyle(color: Colors.white),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, i) => Text(
                                    ' - ',
                                    style: AppTextStyle.appHintStyle
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                  itemCount: ref
                                      .watch(selectedEDITEducationNamesList)
                                      .length,
                                  itemBuilder: (context, i) => Text(
                                    ref.watch(
                                        selectedEDITEducationNamesList)[i],
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: Colors.white, fontSize: 13.sp),
                                  ),
                                ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.watch(showEDITeducationList.notifier).state =
                                !ref.watch(showEDITeducationList);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: ref.watch(showEDITeducationList) ? 127.h : 0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.91),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: BlocBuilder<EducationsCubit, Result<EducationsEntity>>(
                builder: (context, state) => state.when(() => Container(),
                    loading: () => const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                    initial: () => Container(),
                    error: (message, code) => Text(
                          message!,
                          style: AppTextStyle.whiteBold.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    success: (response) {
                      if (response is EducationsEntity &&
                          response.data.isNotEmpty) {
                        return RawScrollbar(
                          isAlwaysShown: true,
                          thumbColor: Colors.white,
                          radius: Radius.circular(10),
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              shrinkWrap: true,
                              children: response.data
                                  .map(
                                    (education) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.h),
                                      child: InkWell(
                                        onTap: () {
                                          if (ref
                                              .watch(
                                                  selectedEDITEducationNamesList)
                                              .contains(education.name)) {
                                            ref
                                                .watch(
                                                    selectedEDITEducationNamesList
                                                        .notifier)
                                                .state
                                                .remove(education.name);
                                            ref
                                                .watch(
                                                    selectedEDITEducationIdList
                                                        .notifier)
                                                .state
                                                .remove(education.id);
                                            setState(() {});
                                          } else {
                                            ref
                                                .watch(
                                                    selectedEDITEducationNamesList
                                                        .notifier)
                                                .state
                                                .add(education.name);
                                            ref
                                                .watch(
                                                    selectedEDITEducationIdList
                                                        .notifier)
                                                .state
                                                .add(education.id);
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: ref
                                                  .watch(
                                                      selectedEDITEducationNamesList)
                                                  .contains(education.name)
                                              ? const Color(0xff5F6998)
                                              : Colors.transparent,
                                          height: 25.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, top: 3.h),
                                            child: Text(
                                              education.name,
                                              style: AppTextStyle.whiteBold
                                                  .copyWith(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
            /////////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////// Country //////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                ref.watch(showEDITcountriesList.notifier).state =
                    !ref.watch(showEDITcountriesList);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 200.w,
                        child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: ref.watch(selectedEDITcountryName) == null
                                ? Text(
                                    'Country',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    ref.watch(selectedEDITcountryName)!,
                                    style: TextStyle(color: Colors.white),
                                  )),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.watch(showEDITcountriesList.notifier).state =
                                !ref.watch(showEDITcountriesList);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: ref.watch(showEDITcountriesList) ? 127.h : 0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.91),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r)),
              ),
              child: BlocBuilder<CountriesCubit, Result<CountriesEntity>>(
                builder: (context, state) => state.when(() => Container(),
                    loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    initial: () => Container(),
                    error: (message, code) => Center(
                          child: Text(
                            message!,
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    success: (response) {
                      if (response is CountriesEntity &&
                          response.data.isNotEmpty) {
                        return MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: RawScrollbar(
                            isAlwaysShown: true,
                            thumbColor: Colors.white,
                            radius: Radius.circular(10),
                            child: ListView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              shrinkWrap: true,
                              children: response.data
                                  .map(
                                    (address) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          ref
                                              .watch(selectedEDITcountryName
                                                  .notifier)
                                              .state = address.name;
                                          ref
                                              .watch(selectedEDITcountryId
                                                  .notifier)
                                              .state = address.id;
                                          BlocProvider.of<
                                                      GetCitiesInCountryCubit>(
                                                  context)
                                              .getCitiesInCountry(
                                                  country_id: ref.watch(
                                                          selectedEDITcountryId) ??
                                                      1);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: ref.watch(
                                                      selectedEDITcountryName) ==
                                                  (address.name)
                                              ? const Color(0xff5F6998)
                                              : Colors.transparent,
                                          height: 25.h,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  address.name,
                                                  style: AppTextStyle.whiteBold
                                                      .copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Something went wrong',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(height: 20.h),
            /////////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////// CITY //////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////

            GestureDetector(
              onTap: () {
                ref.watch(showEDITcityList.notifier).state =
                    !ref.watch(showEDITcityList);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 200.w,
                        child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: ref.watch(selectedEDITcityName) == null||ref.watch(selectedEDITcityName)==''
                                ? Text(
                                    'City',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    ref.watch(selectedEDITcityName)!,
                                    style: TextStyle(color: Colors.white),
                                  )),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.watch(showEDITcityList.notifier).state =
                                !ref.watch(showEDITcityList);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: ref.watch(showEDITcityList) ? 127.h : 0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.91),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r)),
              ),
              child: BlocConsumer<GetCitiesInCountryCubit,
                  Result<GetCitiesInCountry>>(
                   listener: (context,state)=>state.when(() => null,
                       loading:()=>ref.watch(selectedEDITcityName.notifier).state='',
                       initial: ()=>null,
                       error: (e,s)=> null,
                       success: (success)=>null),
                builder: (context, state) => state.when(() => Container(),
                    loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    initial: () => Center(
                          child: Container(
                            child: Text('Please, select a country first.',
                                style: AppTextStyle.appHintStyle.copyWith(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                    error: (message, code) => Center(
                          child: Text(
                            message!,
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    success: (response) {
                      if (response is GetCitiesInCountry &&
                          response.data.isNotEmpty) {
                        return MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: RawScrollbar(
                            isAlwaysShown: true,
                            thumbColor: Colors.white,
                            radius: Radius.circular(10),
                            child: ListView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              shrinkWrap: true,
                              children: response.data
                                  .map(
                                    (address) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          print(address.id);
                                          ref.watch(selectedEDITcityName.notifier).state = address.name;
                                          ref.watch( selectedEDITcityId.notifier).state = address.id;
                                          print(ref.watch(selectedEDITcityId));
                                          },
                                        child: Container(
                                          width: double.infinity,
                                          color: ref.watch(
                                                      selectedEDITcountryName) ==
                                                  (address.name)
                                              ? const Color(0xff5F6998)
                                              : Colors.transparent,
                                          height: 25.h,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  address.name,
                                                  style: AppTextStyle.whiteBold
                                                      .copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else if (response is GetCitiesInCountry &&
                          response.data.isEmpty) {
                        return const Center(
                          child: Text(
                            'please select a country first',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Something went wrong',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(height: 20.h),

            /////////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////// LANGUAGES //////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////

            GestureDetector(
              onTap: () {
                ref.watch(showEDITlanguageList.notifier).state =
                    !ref.watch(showEDITlanguageList);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 200.w,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ref
                                  .watch(selectedEDITlanguagesNamesList)
                                  .isEmpty
                              ? Text(
                                  'Languages',
                                  style: TextStyle(color: Colors.white),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, i) => Text(
                                    ' - ',
                                    style: AppTextStyle.appHintStyle
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                  itemCount: ref
                                      .watch(selectedEDITlanguagesNamesList)
                                      .length,
                                  itemBuilder: (context, i) => Text(
                                    ref.watch(
                                        selectedEDITlanguagesNamesList)[i],
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: Colors.white, fontSize: 13.sp),
                                  ),
                                ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.watch(showEDITlanguageList.notifier).state =
                                !ref.watch(showEDITlanguageList);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: ref.watch(showEDITlanguageList) ? 127.h : 0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.91),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r)),
              ),
              child: BlocBuilder<AllLanguagesCubit, Result<AllLanguagesEntity>>(
                builder: (context, state) => state.when(() => Container(),
                    loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    initial: () => Center(
                          child: Container(),
                        ),
                    error: (message, code) => Center(
                          child: Text(
                            message!,
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    success: (response) {
                      if (response is AllLanguagesEntity &&
                          response.data.isNotEmpty) {
                        return MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: RawScrollbar(
                            isAlwaysShown: true,
                            thumbColor: Colors.white,
                            radius: Radius.circular(10),
                            child: ListView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              shrinkWrap: true,
                              children: response.data
                                  .map(
                                    (address) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (ref.watch(selectedEDITlanguagesNamesList)
                                              .contains(address.name)) {
                                            ref.watch(selectedEDITlanguagesIdsList.notifier)
                                                .state.remove(address.id);
                                            ref.watch( selectedEDITlanguagesNamesList .notifier)
                                                .state
                                                .remove(address.name);
                                            setState(() {});
                                          } else {
                                            ref.watch(selectedEDITlanguagesIdsList.notifier).state
                                                .add(address.id);
                                            ref.watch(selectedEDITlanguagesNamesList.notifier).state
                                                .add(address.name);
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: ref
                                                  .watch(
                                                      selectedEDITlanguagesNamesList)
                                                  .contains(address.name)
                                              ? const Color(0xff5F6998)
                                              : Colors.transparent,
                                          height: 25.h,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  address.name,
                                                  style: AppTextStyle.whiteBold
                                                      .copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else if (response is GetCitiesInCountry &&
                          response.data.isEmpty) {
                        return const Center(
                          child: Text(
                            'No languages available',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Something went wrong',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(height: 20.h),

            /////////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////// SERVICES //////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////

            GestureDetector(
              onTap: () {
                ref.watch(showEDITselectedServicesList.notifier).state =
                    !ref.watch(showEDITselectedServicesList);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 200.w,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ref.watch(selectedEDITServiceNamesList).isEmpty
                              ? Text(
                                  'Services',
                                  style: TextStyle(color: Colors.white),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, i) => Text(
                                    ' - ',
                                    style: AppTextStyle.appHintStyle
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                  itemCount: ref
                                      .watch(selectedEDITServiceNamesList)
                                      .length,
                                  itemBuilder: (context, i) => Text(
                                    ref.watch(selectedEDITServiceNamesList)[i],
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: Colors.white, fontSize: 13.sp),
                                  ),
                                ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.watch(showEDITselectedServicesList.notifier)
                                    .state =
                                !ref.watch(showEDITselectedServicesList);
                            if (ref.watch(showEDITselectedServicesList)) {
                              BlocProvider.of<GetAllServicesCubit>(context)
                                  .getAllServices();
                            }
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: ref.watch(showEDITselectedServicesList) ? 127.h : 0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.91),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r)),
              ),
              child: BlocBuilder<GetAllServicesCubit,
                  Result<GetAllServicesEntity>>(
                builder: (context, state) => state.when(() => Container(),
                    loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    initial: () => Center(
                          child: Container(),
                        ),
                    error: (message, code) => Center(
                          child: Text(
                            message!,
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    success: (response) {
                      if (response is GetAllServicesEntity &&
                          response.data.isNotEmpty) {
                        return MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: RawScrollbar(
                            isAlwaysShown: true,
                            thumbColor: Colors.white,
                            radius: const Radius.circular(10),
                            child: ListView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              shrinkWrap: true,
                              children: response.data
                                  .map(
                                    (address) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          print('hellow');
                                          if (ref
                                              .watch(
                                                  selectedEDITServiceNamesList)
                                              .contains(address.name)) {
                                            ref
                                                .watch(
                                                    selectedEDITServicesIdsList
                                                        .notifier)
                                                .state
                                                .remove(address.id);
                                            ref
                                                .watch(
                                                    selectedEDITServiceNamesList
                                                        .notifier)
                                                .state
                                                .remove(address.name);
                                            setState(() {});
                                          } else {
                                            ref
                                                .watch(
                                                    selectedEDITServicesIdsList
                                                        .notifier)
                                                .state
                                                .add(address.id);
                                            ref
                                                .watch(
                                                    selectedEDITServiceNamesList
                                                        .notifier)
                                                .state
                                                .add(address.name);
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: ref
                                                  .watch(
                                                      selectedEDITServiceNamesList)
                                                  .contains(address.name)
                                              ? const Color(0xff5F6998)
                                              : Colors.transparent,
                                          height: 25.h,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  address.name,
                                                  style: AppTextStyle.whiteBold
                                                      .copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else if (response is GetAllServicesEntity &&
                          response.data.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Services available',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Something went wrong',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(height: 20.h),

            SizedBox(height: 10.h),
            //save changes button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //   SizedBox(width: 110.w,),
                Consumer(builder: (context, ref, _) {
                  return BlocBuilder<EditDetailsCubit,
                      Result<EditUserDetailsEntity>>(builder: (context, state) {
                    if (state is Loading) {
                      return CircularProgressIndicator(
                        color: Colors.white,
                      );
                    } else {
                      return AppButtons(
                        buttonText: 'SAVE CHANGES',
                        buttonColor: const Color(0xff343D58),
                        onPressed: () {
                          print(ref.watch(selectedEDITcountryId));
                            print(ref.watch(selectedEDITServicesIdsList));
                            print(ref.watch(selectedEDITcityId));
                            print(ref.watch(selectedEDITlanguagesIdsList));
                            print(ref.watch(selectedEDITEducationIdList));
                          getUserId().then(
                            (id) => bearerTokenRetreiver().then(
                              (bearer) =>
                                  BlocProvider.of<EditDetailsCubit>(context)
                                      .editDetails(
                                        user_id: id,
                                        content_type:
                                            'multipart/form-data; boundary=<calculated when request is sent>',
                                        bearer_token: "Bearer $bearer",
                                        country_id:
                                            ref.watch(selectedEDITcountryId) ?? null,
                                        city_id: "${ref.watch(selectedEDITcityId)??null}",
                                        service_ids:
                                            "${ref.watch(selectedEDITServicesIdsList).isEmpty?null:ref.watch(selectedEDITServicesIdsList)}",
                                        language_ids:
                                            "${ref.watch(selectedEDITlanguagesIdsList).isEmpty?null:ref.watch(selectedEDITlanguagesIdsList)}",
                                        about: ref.watch(aboutMeProvider),
                                        education_ids:
                                            "${ref.watch(selectedEDITEducationIdList).isEmpty?null:ref.watch(selectedEDITEducationIdList)}",
                                      )
                                      .then(
                                        (value) => BlocProvider.of<
                                                    PersonalAssistantHomePageCubit>(
                                                context)
                                            .getPersonalAssistant(
                                          id: id ?? 0,
                                        ),
                                      ),
                            ),
                          );
                        },
                        height: 29.h,
                        width: 120.w,
                        buttonTextStyle:
                            AppTextStyle.whiteBold.copyWith(fontSize: 9.sp),
                      );
                    }
                  });
                }),
              ],
            ),
          ],
        ),
      );
    });
  }
} /*/*DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                  isExpanded: true,
                                  dropdownColor:
                                      AppColors.primaryColor.withOpacity(.91),
                                  value: ref.watch(selectedEducationProvider),
                                  hint: Text(
                                    'Education',
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: const Color(0xff998FA2),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  iconDisabledColor: Colors.white,
                                  iconEnabledColor: Colors.white,
                                  items: response.data
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (v) {
                                    if (v is EducationDataEntity) {
                                      if (ref
                                          .watch(
                                              personalAssistantEducationIdsList)!
                                          .contains(v.id)) {
                                      } else {
                                        ref
                                            .watch(
                                                personalAssistantEducationIdsList
                                                    .notifier)
                                            .state!
                                            .add(v.id);
                                      }
                                      print(ref.watch(
                                          personalAssistantEducationIdsList));
                                      ref
                                          .watch(selectedEducationProvider
                                              .notifier)
                                          .state = v;
                                    }
                                  },
                                ),
                              ),*/*/

// country
/*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Country',
                style: AppTextStyle.appHintStyle.copyWith(
                  color: const Color(0xff998FA2),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              /*SizedBox(
                width: 70.w,
              ),*/
              BlocBuilder<CountriesCubit, Result<CountriesEntity>>(
                builder: (context, state) => state.when(() => Container(),
                    loading: () => Container(
                          height: 45.h,
                          width: 180.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    initial: () => Container(),
                    error: (error, s) => Text(error!),
                    success: (response) {
                      if (response is CountriesEntity) {
                        return Consumer(builder: (context, ref, _) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.white),
                            ),
                            color: const Color(0xff181928),
                            child: Container(
                              height: 40.h,
                              width: 130.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                    isExpanded: true,
                                    dropdownColor:
                                        AppColors.primaryColor.withOpacity(.91),
                                    value: ref.watch(selectedCountryProvider),
                                    hint: Text(
                                      'Country',
                                      style: AppTextStyle.appHintStyle.copyWith(
                                          color: const Color(0xff998FA2),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    iconDisabledColor: Colors.white,
                                    iconEnabledColor: Colors.white,
                                    items: response.data
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e.name),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (v) {
                                      if (v is CountriesDataEntity) {
                                        ref
                                            .watch(selectedCountryId.notifier)
                                            .state = v.id;
                                        ref
                                            .watch(selectedCountryProvider
                                                .notifier)
                                            .state = v;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      } else {
                        return Text('Something went wrong');
                      }
                    }),
              ),
            ],
          ),*/

//Education
/*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Education',
                style: AppTextStyle.appHintStyle.copyWith(
                  color: const Color(0xff998FA2),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              BlocBuilder<EducationsCubit, Result<EducationsEntity>>(
                builder: (context, state) => state.when(() => Container(),
                    loading: () => Container(
                          height: 45.h,
                          width: 180.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    initial: () => Container(),
                    error: (error, s) => Text(error!),
                    success: (response) {
                      if (response is EducationsEntity) {
                        return Consumer(builder: (context, ref, _) {
                          return Container(
                            height: 40.h,
                            width: 220.w,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: DropDownMultiSelect(
                                  options:
                                      response.data.map((e) => e.name).toList(),
                                  selectedValues: [],
                                  onChanged: (List<String> values) {},
                                  whenEmpty: '',
                                  enabled: true,
                                )),
                          );
                        });
                      } else {
                        return Text('Something went wrong');
                      }
                    }),
              ),
            ],
          ),*/
