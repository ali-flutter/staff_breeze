import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/add_languages_cubit.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/education_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/uploading_image_functionality.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../style/app_images.dart';
import '../business_logic/controller/complete_registration_state_controller.dart';
import '../business_logic/controller/sign_up_state_controller.dart';
import '../widgets/complete_registration_text_field.dart';
import '../widgets/custom_drop_down_widget.dart';
import '../widgets/drop_down_widget.dart';

class CompleteRegistrationPage extends StatefulWidget {
  const CompleteRegistrationPage({Key? key}) : super(key: key);

  @override
  State<CompleteRegistrationPage> createState() =>
      _CompleteRegistrationPageState();
}

class _CompleteRegistrationPageState extends State<CompleteRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  final snackBar = const SnackBar(
    content: Text('Please complete your profile first!'),
  );
  ScrollController educationScrollController = ScrollController();
  ScrollController languagesScrollController = ScrollController();
  ScrollController addressScrollController = ScrollController();
  ScrollController servicesScrollController = ScrollController();
@override
  void dispose() {
   educationScrollController.dispose();
   languagesScrollController.dispose()  ;
   addressScrollController.dispose();
   servicesScrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        return GestureDetector(
          onTap: () {
            ref.watch(showCitieslist.notifier).state=false;
            ref.watch(showEducationList.notifier).state = false;
            ref.watch(showGenderList.notifier).state = false;
            ref.watch(showLanguagesList.notifier).state = false;
            ref.watch(showAddressList.notifier).state = false;
            ref.watch(showServicesList.notifier).state = false;
          },
          child: SingleChildScrollView(
            child: Consumer(builder: (context, ref, _) {
              return GestureDetector(
                onTap: () {
                  ref.watch(showCitieslist.notifier).state=false;
                  ref.watch(showEducationList.notifier).state = false;
                  ref.watch(showGenderList.notifier).state = false;
                  ref.watch(showLanguagesList.notifier).state = false;
                  ref.watch(showAddressList.notifier).state = false;
                  ref.watch(showAddressList.notifier).state = false;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Consumer(
                            builder: (context, ref, _) {
                              return Text(
                                'Welcome ${ref.watch(signUpUserNameProvider)}',
                                style: AppTextStyle.ironExtraBig.copyWith(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                              );
                            },
                          ),
                          Text(
                            'Please complete your profile',
                            style: AppTextStyle.ironExtraBig.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          SizedBox(
                            height: 49.h,
                          ),
                          Consumer(
                              builder: (context,ref,_) {
                                return GestureDetector(
                                  onTap: (){
                                    ref.watch(showEducationList.notifier).state =
                                    !ref.watch(showEducationList);
                                    if (ref.watch(showEducationList) == true) {
                                      ref.watch(showCitieslist.notifier).state=false;
                                      ref.watch(showServicesList.notifier).state=false;
                                      ref.watch(showAddressList.notifier).state=false;
                                      ref.watch(showLanguagesList.notifier).state=false;
                                      ref.watch(showGenderList.notifier).state=false;
                                      BlocProvider.of<EducationsCubit>(context)
                                          .getEducations();
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ref.watch(selectedEducationList).isEmpty
                                                  ? Text(
                                                "Education",
                                                style: AppTextStyle.appHintStyle,
                                              )
                                                  : SizedBox(

                                                height: 29.h,
                                                width: 280.w,
                                                child:ListView.builder(
                                                    itemCount: ref.watch(selectedEducationList).length,
                                                    scrollDirection: Axis.horizontal,
                                                    itemBuilder: (context,i) {

                                                      return Padding(
                                                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                                        child: Chip(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(7.r),
                                                              side: const BorderSide(
                                                                color: Color(0xff707070),
                                                              ),
                                                            ),
                                                            label: Text(ref.watch(selectedEducationList)[i]),
                                                            elevation: 0,
                                                            backgroundColor: AppColors.scaffoldBackgroundColor,
                                                            deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                                            onDeleted: (){
                                                              ref.watch(selectedEducationList.notifier).state.remove(ref.watch(selectedEducationList)[i]);
                                                              ref.watch(selectedEducationIds.notifier).state.removeAt(i);
                                                              print(i);

                                                              print("SELECTED Education FROM ON deleted${ref.watch(selectedLanguagesList)}");
                                                              setState(() {

                                                              });
                                                            }//onDeleted,
                                                        ),
                                                      );
                                                    }
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:(){
                                                    ref.watch(showEducationList.notifier).state =
                                                    !ref.watch(showEducationList);
                                                    if (ref.watch(showEducationList) == true) {
                                                      ref.watch(showCitieslist.notifier).state=false;
                                                      ref.watch(showServicesList.notifier).state=false;
                                                      ref.watch(showAddressList.notifier).state=false;
                                                      ref.watch(showLanguagesList.notifier).state=false;
                                                      ref.watch(showGenderList.notifier).state=false;
                                                      BlocProvider.of<EducationsCubit>(context)
                                                          .getEducations();
                                                    }

                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Color(0xff998FA2),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: const Color(0xffDDDDDD),
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                         /* Consumer(builder: (context, ref, _) {
                            return CustomDropdownWidget(
                              onEntireWidgetPressed: (){ref.watch(showEducationList.notifier).state =
                              !ref.watch(showEducationList);
                              if (ref.watch(showEducationList) == true) {
                                ref.watch(showCitieslist.notifier).state=false;
                                ref.watch(showServicesList.notifier).state=false;
                                ref.watch(showAddressList.notifier).state=false;
                                ref.watch(showLanguagesList.notifier).state=false;
                                ref.watch(showGenderList.notifier).state=false;
                                BlocProvider.of<EducationsCubit>(context)
                                    .getEducations();
                              }},
                              hint: 'Education',
                              remover: selectedSingleEducation,
                              listToRemoveFrom: selectedEducationList,
                              selectedItem: ref.watch(selectedEducationList),
                              onPressed: () {
                                ref.watch(showCitieslist.notifier).state=false;
                                ref.watch(showServicesList.notifier).state=false;
                                ref.watch(showAddressList.notifier).state=false;
                                ref.watch(showLanguagesList.notifier).state=false;
                                ref.watch(showGenderList.notifier).state=false;
                                ref.watch(showEducationList.notifier).state =
                                    !ref.watch(showEducationList);
                                if (ref.watch(showEducationList) == true) {
                                  BlocProvider.of<EducationsCubit>(context)
                                      .getEducations();
                                }
                              },
                            );
                          }),*/
                          SizedBox(
                            height: 24.h,
                          ),
                          Consumer(
                              builder: (context,ref,_) {
                                return GestureDetector(
                                  onTap: (){
                                    ref.watch(showLanguagesList.notifier).state =
                                    !ref.watch(showLanguagesList);
                                    if (ref.watch(showLanguagesList) == true) {
                                      ref.watch(showEducationList.notifier).state=false;
                                      ref.watch(showAddressList.notifier).state=false;
                                      ref.watch(showServicesList.notifier).state=false;
                                      ref.watch(showGenderList.notifier).state=false;

                                      BlocProvider.of<AllLanguagesCubit>(context)
                                          .getAllLanguages();
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ref.watch(selectedLanguagesList).isEmpty
                                                  ? Text(
                                                "Languages",
                                                style: AppTextStyle.appHintStyle,
                                              )
                                                  : SizedBox(

                                                height: 29.h,
                                                width: 280.w,
                                                child:ListView.builder(
                                                    itemCount: ref.watch(selectedLanguagesList).length,
                                                    scrollDirection: Axis.horizontal,
                                                    itemBuilder: (context,i) {

                                                      return Padding(
                                                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                                        child: Chip(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(7.r),
                                                              side: const BorderSide(
                                                                color: Color(0xff707070),
                                                              ),
                                                            ),
                                                            label: Text(ref.watch(selectedLanguagesList)[i]),
                                                            elevation: 0,
                                                            backgroundColor: AppColors.scaffoldBackgroundColor,
                                                            deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                                            onDeleted: (){
                                                              ref.watch(selectedLanguagesList.notifier).state.remove(ref.watch(selectedLanguagesList)[i]);
                                                              ref.watch(selectedLanguagesIdComplete.notifier).state.removeAt(i);
                                                              print(i);

                                                              print("SELECTED languages FROM ON deleted${ref.watch(selectedLanguagesList)}");
                                                              setState(() {

                                                              });
                                                            }//onDeleted,
                                                        ),
                                                      );
                                                    }
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:(){
                                                    ref.watch(showLanguagesList.notifier).state =
                                                    !ref.watch(showLanguagesList);
                                                    if (ref.watch(showLanguagesList) == true) {
                                                      ref.watch(showEducationList.notifier).state=false;
                                                      ref.watch(showAddressList.notifier).state=false;
                                                      ref.watch(showServicesList.notifier).state=false;
                                                      ref.watch(showGenderList.notifier).state=false;

                                                      BlocProvider.of<AllLanguagesCubit>(context)
                                                          .getAllLanguages();
                                                    }

                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Color(0xff998FA2),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: const Color(0xffDDDDDD),
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),

                          SizedBox(
                            height: 24.h,
                          ),
                          Consumer(
                              builder: (context,ref,_) {
                                return GestureDetector(
                                  onTap: (){
                                    ref.watch(showGenderList.notifier).state =
                                    !ref.watch(showGenderList);
                                    if(ref.watch(showGenderList)){
                                      ref.watch(showEducationList.notifier).state=false;
                                      ref.watch(showAddressList.notifier).state=false;
                                      ref.watch(showLanguagesList.notifier).state=false;
                                      ref.watch(showServicesList.notifier).state=false;
                                      ref.watch(showCitieslist.notifier).state=false;
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ref.watch(selectedGenderId)==null
                                                  ? Text(
                                                "Gender",
                                                style: AppTextStyle.appHintStyle,
                                              )
                                                  : SizedBox(
                                                height: 29.h,
                                                // width: 24.w,
                                                child:Chip(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(7.r),
                                                      side: const BorderSide(
                                                        color: Color(0xff707070),
                                                      ),
                                                    ),
                                                    label: Text(ref.watch(selectedGenderId)==1?'Male':'Female'),
                                                    elevation: 0,
                                                    backgroundColor: AppColors.scaffoldBackgroundColor,
                                                    deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                                    onDeleted: (){
                                                     ref.watch(selectedGenderId.notifier).state=null;
                                                     ref.watch(selectedGenderList.notifier).state.clear();
                                                       setState(() {

                                                      });
                                                    }//onDeleted,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:(){

                                                    ref.watch(showGenderList.notifier).state =
                                                    !ref.watch(showGenderList);
                                                    if(ref.watch(showGenderList)){
                                                      ref.watch(showEducationList.notifier).state=false;
                                                      ref.watch(showAddressList.notifier).state=false;
                                                      ref.watch(showLanguagesList.notifier).state=false;
                                                      ref.watch(showServicesList.notifier).state=false;
                                                      ref.watch(showCitieslist.notifier).state=false;
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Color(0xff998FA2),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: const Color(0xffDDDDDD),
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                          /*CustomDropdownWidget(
                            onEntireWidgetPressed: (){
                              ref.watch(showGenderList.notifier).state =
                              !ref.watch(showGenderList);
                             if(ref.watch(showGenderList)){
                               ref.watch(showEducationList.notifier).state=false;
                               ref.watch(showAddressList.notifier).state=false;
                               ref.watch(showLanguagesList.notifier).state=false;
                               ref.watch(showServicesList.notifier).state=false;
                               ref.watch(showCitieslist.notifier).state=false;
                             }
                            },
                            hint: 'Gender',
                            remover: selectedSingleGender,
                            listToRemoveFrom: selectedGenderList,
                            selectedItem: ref.watch(selectedGenderList),
                            onPressed: () {
                              ref.watch(showGenderList.notifier).state =
                                  !ref.watch(showGenderList);
                              if(ref.watch(showGenderList))   {
                                ref.watch(showEducationList.notifier).state=false;
                                ref.watch(showAddressList.notifier).state=false;
                                ref.watch(showLanguagesList.notifier).state=false;
                                ref.watch(showServicesList.notifier).state=false;
                                ref.watch(showCitieslist.notifier).state=false;
                              }
                            },
                          ),*/
                          SizedBox(
                            height: 24.h,
                          ),Consumer(
                              builder: (context,ref,_) {
                                return GestureDetector(
                                  onTap: (){
                                    ref.watch(showAddressList.notifier).state=!ref.watch(showAddressList);
                                    if(ref.watch(showAddressList)){
                                      ref.watch(showCitieslist.notifier).state=false;
                                      ref.watch(showServicesList.notifier).state=false;
                                      ref.watch(showEducationList.notifier).state=false;
                                      ref.watch(showLanguagesList.notifier).state=false;
                                      ref.watch(showGenderList.notifier).state=false;
                                      BlocProvider.of<CountriesCubit>(context).getCountries();
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ref.watch(selectedCountryNameCompleteRegistration)==null
                                                  ? Text(
                                                "Country",
                                                style: AppTextStyle.appHintStyle,
                                              )
                                                  : SizedBox(
                                                height: 29.h,
                                                // width: 24.w,
                                                child:Chip(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(7.r),
                                                      side: const BorderSide(
                                                        color: Color(0xff707070),
                                                      ),
                                                    ),
                                                    label: Text(ref.watch(selectedCountryNameCompleteRegistration)!),
                                                    elevation: 0,
                                                    backgroundColor: AppColors.scaffoldBackgroundColor,
                                                    deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                                    onDeleted: (){
                                                      ref.watch(selectedCountryNameCompleteRegistration.notifier).state=null;
                                                      ref.watch(selectedCountryIdCompleteRegistration.notifier).state=null;
                                                      /* setState(() {

                                                      });*/
                                                    }//onDeleted,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:(){

                                                    ref.watch(showAddressList.notifier).state=!ref.watch(showAddressList);
                                                    if(ref.watch(showAddressList)){
                                                      ref.watch(showCitieslist.notifier).state=false;
                                                      ref.watch(showServicesList.notifier).state=false;
                                                      ref.watch(showEducationList.notifier).state=false;
                                                      ref.watch(showLanguagesList.notifier).state=false;
                                                      ref.watch(showGenderList.notifier).state=false;
                                                     /* if(ref.watch(selectedCountryIdCompleteRegistration)!=null){
                                                        BlocProvider.of<GetCitiesInCountryCubit>(context).getCitiesInCountry(
                                                            country_id:ref.watch(selectedCountryIdCompleteRegistration)!);}
*/
                                                      BlocProvider.of<CountriesCubit>(context).getCountries();
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Color(0xff998FA2),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: const Color(0xffDDDDDD),
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                         
                          SizedBox(height: 24.h),

                          Consumer(
                              builder: (context,ref,_) {
                                return GestureDetector(
                                  onTap: (){
                                    ref.watch(showCitieslist.notifier).state=!ref.watch(showCitieslist);
                                    if(ref.watch(showCitieslist)){
                                      ref.watch(showAddressList.notifier).state=false;
                                      ref.watch(showServicesList.notifier).state=false;
                                      ref.watch(showEducationList.notifier).state=false;
                                      ref.watch(showLanguagesList.notifier).state=false;
                                      ref.watch(showGenderList.notifier).state=false;
                                      if(ref.watch(selectedCountryIdCompleteRegistration)!=null){
                                        BlocProvider.of<GetCitiesInCountryCubit>(context).getCitiesInCountry(
                                            country_id:ref.watch(selectedCountryIdCompleteRegistration)!);}
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ref.watch(selectedCityNameCompleteRegistration)==null
                                                  ? Text(
                                                "City",
                                                style: AppTextStyle.appHintStyle,
                                              )
                                                  : SizedBox(
                                                height: 29.h,
                                                // width: 24.w,
                                                child:Chip(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(7.r),
                                                      side: const BorderSide(
                                                        color: Color(0xff707070),
                                                      ),
                                                    ),
                                                    label: Text(ref.watch(selectedCityNameCompleteRegistration)!),
                                                    elevation: 0,
                                                    backgroundColor: AppColors.scaffoldBackgroundColor,
                                                    deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                                    onDeleted: (){
                                                        ref.watch(selectedCityNameCompleteRegistration.notifier).state=null;
                                                        ref.watch(selectedCityIdCompleteRegistration.notifier).state=null;
                                                     /* setState(() {

                                                      });*/
                                                    }//onDeleted,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:(){

                                                    ref.watch(showCitieslist.notifier).state=!ref.watch(showCitieslist);
                                                    if(ref.watch(showCitieslist)){
                                                      ref.watch(showAddressList.notifier).state=false;
                                                      ref.watch(showServicesList.notifier).state=false;
                                                      ref.watch(showEducationList.notifier).state=false;
                                                      ref.watch(showLanguagesList.notifier).state=false;
                                                      ref.watch(showGenderList.notifier).state=false;
                                                      if(ref.watch(selectedCountryIdCompleteRegistration)!=null){
                                                      BlocProvider.of<GetCitiesInCountryCubit>(context).getCitiesInCountry(
                                                        country_id:ref.watch(selectedCountryIdCompleteRegistration)!);}

                                                    }
                                                    },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Color(0xff998FA2),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: const Color(0xffDDDDDD),
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                          SizedBox(height: 24.h,),
                          Consumer(
                              builder: (context,ref,_) {
                                return GestureDetector(
                                  onTap: (){
                                    ref.watch(showServicesList.notifier).state =
                                    !ref.watch(showServicesList);
                                    if (ref.watch(showServicesList) == true) {
                                      ref.watch(showEducationList.notifier).state=false;
                                      ref.watch(showAddressList.notifier).state=false;
                                      ref.watch(showLanguagesList.notifier).state=false;
                                      ref.watch(showGenderList.notifier).state=false;
                                      BlocProvider.of<GetAllServicesCubit>(context)
                                          .getAllServices();
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ref.watch(selectedServicesList).isEmpty
                                                  ? Text(
                                                "Services",
                                                style: AppTextStyle.appHintStyle,
                                              )
                                                  : SizedBox(

                                                height: 29.h,
                                                 width: 280.w,
                                                child:ListView.builder(
                                                  itemCount: ref.watch(selectedServicesList).length,
                                                  scrollDirection: Axis.horizontal,
                                                    itemBuilder: (context,i) {

                                                    return Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                                      child: Chip(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(7.r),
                                                            side: const BorderSide(
                                                              color: Color(0xff707070),
                                                            ),
                                                          ),
                                                          label: Text(ref.watch(selectedServicesList)[i]),
                                                          elevation: 0,
                                                          backgroundColor: AppColors.scaffoldBackgroundColor,
                                                          deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                                          onDeleted: (){
                                                            ref.watch(selectedServicesList.notifier).state.remove(ref.watch(selectedServicesList)[i]);
                                                            ref.watch(selectedServicesId.notifier).state.removeAt(i);
                                                            print(i);

                                                            print("SELECTED SERVICES FROM ON deleted${ref.watch(selectedServicesId)}");
                                                             setState(() {

                                                            });
                                                          }//onDeleted,
                                                      ),
                                                    );
                                                  }
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:(){
                                                    ref.watch(showServicesList.notifier).state =
                                                    !ref.watch(showServicesList);
                                                    if (ref.watch(showServicesList) == true) {
                                                      ref.watch(showEducationList.notifier).state=false;
                                                      ref.watch(showAddressList.notifier).state=false;
                                                      ref.watch(showLanguagesList.notifier).state=false;
                                                      ref.watch(showGenderList.notifier).state=false;
                                                      BlocProvider.of<GetAllServicesCubit>(context)
                                                          .getAllServices();
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Color(0xff998FA2),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: const Color(0xffDDDDDD),
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                         /* CustomDropdownWidget(
                            onEntireWidgetPressed: (){
                              ref.watch(showServicesList.notifier).state =
                              !ref.watch(showServicesList);
                              if (ref.watch(showServicesList) == true) {
                                ref.watch(showEducationList.notifier).state=false;
                                ref.watch(showAddressList.notifier).state=false;
                                ref.watch(showLanguagesList.notifier).state=false;
                                ref.watch(showGenderList.notifier).state=false;
                                BlocProvider.of<GetAllServicesCubit>(context)
                                    .getAllServices();
                              }
                            },
                            remover: selectedSingleService,
                            listToRemoveFrom: selectedServicesList,
                            hint: 'Services',
                            selectedItem: ref.watch(selectedServicesList),
                            onPressed: () {
                              ref.watch(showServicesList.notifier).state =
                                  !ref.watch(showServicesList);
                              if (ref.watch(showServicesList) == true) {
                                ref.watch(showEducationList.notifier).state=false;
                                ref.watch(showAddressList.notifier).state=false;
                                ref.watch(showLanguagesList.notifier).state=false;
                                ref.watch(showGenderList.notifier).state=false;
                                BlocProvider.of<GetAllServicesCubit>(context)
                                    .getAllServices();
                              }
                            },
                          ),*/
                          SizedBox(
                            height: 28.h,
                          ),
                          const CompleteRegistrationTextField(),
                          SizedBox(
                            height: 20.h,
                          ),
                          DottedBorder(
                            strokeWidth: 1.w,
                            color: const Color(0XffDDDDDD),
                            child: SizedBox(
                              height: 57.h,
                              width: 331.w,
                              child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 19.w, right: 14.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ref.watch(uploadedImage) == null
                                          ? Text(
                                              'Upload your photo',
                                              style: AppTextStyle.appHintStyle
                                                  .copyWith(
                                                      color: const Color(
                                                              0xff241332)
                                                          .withOpacity(.32),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            )
                                          : Text(
                                              'Successfully uploaded',
                                              style: AppTextStyle.appHintStyle
                                                  .copyWith(
                                                color: const Color(0xff241332)
                                                    .withOpacity(.32),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                side: BorderSide(
                                                  width: 1.h,
                                                  color:
                                                      const Color(0xff707070),
                                                ),
                                              ),
                                            )),
                                        onPressed: () async {
                                          ref
                                                  .watch(uploadedImage.notifier)
                                                  .state =
                                              await UploadingAnImage.pickImage(
                                                  source: ImageSource.gallery);
                                          print('pressed');
                                        },
                                        child: SizedBox(
                                          height: 22.h,
                                          width: 79.w,
                                          child: Center(
                                            child: Text(
                                              'SELECT FILE',
                                              style: AppTextStyle.appHintStyle
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff352641),
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          BlocConsumer<EditDetailsCubit, Result<EditUserDetailsEntity>>(
                            listener: (context, state) => state.when(() => null,
                                loading: () => null,
                                initial: () => null,
                                error: (message, code) =>
                                    AppDialogs.errorDialog(context,
                                        error:
                                            message ?? 'Something went wrong',
                                        onConfirmBtnTap: () {
                                      bearerTokenRetreiver().then((value) =>
                                          BlocProvider.of<EditDetailsCubit>(
                                                  context)
                                              .editDetails(
                                            content_type:
                                                "multipart/form-data; boundary=<calculated when request is sent>",
                                            bearer_token: "Bearer $value",
                                            user_id: ref.watch(userIdProvider),
                                            email:
                                                ref.watch(signUpEmailProvider),
                                            phone_number: ref.watch(
                                                phoneNumberCompleteRegistrationProvider),
                                            profile_image:
                                                ref.watch(uploadedImage),
                                            about: null,
                                            city_id: null,
                                            country_id:
                                                ref.watch(selectedLocationId),
                                            is_male:
                                                ref.watch(selectedGenderId),
                                            location: null,
                                            education_ids: "${ref.watch(selectedEducationIds)}",
                                            service_ids:"${ref.watch(selectedServicesId)}"
                                          ));

                                      Navigator.pop(context);
                                    }),
                                success: (response) =>
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        PERSONAL_ASSISTANT_HOMEPAGE,
                                        (route) => false)),
                            builder: (context, state) {
                              if(state is Loading){
                                return const Center(
                                  child:CircularProgressIndicator()
                                );
                              }else{
                                return AppButtons(
                                  buttonText: 'Continue',
                                  buttonColor: AppColors.primaryColor,
                                  onPressed: () {

                                    if (ref.watch(selectedCityIdCompleteRegistration) !=null &&
                                        ref.watch(selectedGenderId) != null &&
                                        ref.watch(selectedEducationIds).isNotEmpty &&
                                        ref.watch(selectedServicesId).isNotEmpty &&
                                        ref.watch(selectedCountryIdCompleteRegistration )!=null
                                    ) {
                                      print("the Services Ids List is ${ref.watch(selectedServicesId)}");
                                      print("the selected city id is ${ref.watch(selectedCityIdCompleteRegistration)}");
                                      print("phone number ${phoneNumberCompleteRegistrationProvider}");
                                      print("education ids is  ${ref.watch(selectedEducationIds)}");
                                      print("languages ids ${ref.watch(selectedLanguagesIdComplete)}");
                                      print("country id is ${ref.watch(selectedCountryIdCompleteRegistration)}");
                                      print("is male ${ref.watch(selectedGenderId)}");
                                      bearerTokenRetreiver().then((bearer) {
                                        getUserId().then((id) =>
                                            BlocProvider.of<EditDetailsCubit>(context).editDetails(
                                                content_type:
                                                "multipart/form-data; boundary=<calculated when request is sent>",
                                                bearer_token: "Bearer $bearer",
                                                user_id: id,
                                                phone_number: ref.watch(phoneNumberCompleteRegistrationProvider),
                                                profile_image:ref.watch(uploadedImage),
                                                about: null,
                                                city_id: "${ref.watch(selectedCityIdCompleteRegistration)}",
                                                country_id:ref.watch(selectedCountryIdCompleteRegistration),
                                                is_male:ref.watch(selectedGenderId),
                                                location: null,
                                                service_ids:"${ref.watch(selectedServicesId)}" ,
                                                education_ids: "${ref.watch(selectedEducationIds)}",
                                                language_ids: "${ref.watch(selectedLanguagesIdComplete)}",

                                            ));
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  height: 52.h,
                                  width: 327.h,
                                  buttonTextStyle:
                                  AppTextStyle.buttonTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }
                            }
                          ),
                        ],
                      ),

                      ///Education List
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 174.h,
                          ),

                          //! educations container
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: ref.watch(showEducationList) ? 127.h : 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.91),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                            ),
                            child: BlocBuilder<EducationsCubit,
                                Result<EducationsEntity>>(
                              builder: (context, state) => state.when(
                                  () => Container(),
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
                                        controller: educationScrollController,
                                        isAlwaysShown: true,
                                        thumbColor: Colors.white,
                                        radius: Radius.circular(10),
                                        child: MediaQuery.removePadding(
                                          context: context,
                                          removeTop: true,
                                          child: ListView(
                                            controller:
                                                educationScrollController,
                                            physics: const BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics()),
                                            shrinkWrap: true,
                                            children: response.data
                                                .map(
                                                  (education) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.h),
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (ref.watch(selectedEducationList).contains(education .name)) {
                                                          null;
                                                        } else if(ref.watch(selectedEducationList).length==1) {
                                                          ref.watch(selectedEducationList.notifier).state.clear();
                                                          ref.watch(selectedEducationIds.notifier).state.clear();
                                                          ref.watch(selectedEducationList.notifier).state.add(education.name);
                                                          ref.watch(selectedEducationIds.notifier).state.add(education.id);
                                                          setState(() {});
                                                        }else{
                                                          ref.watch(selectedEducationList.notifier).state.add(education.name);
                                                          ref.watch(selectedEducationIds.notifier).state.add(education.id);
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: ref.watch(selectedEducationList).contains(education.name)
                                                            ? const Color(0xff5F6998)
                                                            : Colors.transparent,
                                                        height: 25.h,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w,
                                                                  top: 3.h),
                                                          child: Text(
                                                            education.name,
                                                            style: AppTextStyle.whiteBold.copyWith(
                                                                    fontSize: 13.5.sp,
                                                                    fontWeight:FontWeight.w500),
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
                        ],
                      ),

                      ///Languages List
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 237.h,
                          ),
                          AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: ref.watch(showLanguagesList) ? 127.h : 0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(.91),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r)),
                              ),
                              child: BlocBuilder<AllLanguagesCubit,Result<AllLanguagesEntity>>(
                                builder: (context, state) => state.when(
                                  () => Container(),
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
                                    if (response is AllLanguagesEntity &&
                                        response.data.isNotEmpty) {
                                      return MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: RawScrollbar(
                                          controller: languagesScrollController,
                                          isAlwaysShown: true,
                                          thumbColor: Colors.white,
                                          radius: Radius.circular(10),
                                          child: ListView(
                                            controller:
                                                languagesScrollController,
                                            physics: const BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics()),
                                            shrinkWrap: true,
                                            children: response.data
                                                .map(
                                                  (language) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.h),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (ref
                                                            .watch(selectedLanguagesList).contains(language.name)) {
                                                          null;
                                                        } else {
                                                          ref.watch(selectedLanguagesIdComplete.notifier).state.add(language.id);
                                                          ref.watch(selectedLanguagesList.notifier) .state.add(language.name);
                                                          print(ref.watch(selectedLanguagesIdComplete));
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: ref
                                                                .watch(
                                                                    selectedLanguagesList)
                                                                .contains(
                                                                    language
                                                                        .name)
                                                            ? const Color(
                                                                0xff5F6998)
                                                            : Colors
                                                                .transparent,
                                                        height: 25.h,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w),
                                                          child: Text(
                                                            language.name,
                                                            style: AppTextStyle
                                                                .whiteBold
                                                                .copyWith(
                                                                    fontSize:
                                                                        13.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
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
                                      return Center(
                                        child: Text(
                                          'SomeThing went wrong',
                                          style:
                                              AppTextStyle.whiteBold.copyWith(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )),
                        ],
                      ),

                      ///GenderList
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 301.h,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: ref.watch(showGenderList) ? 84.h : 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.91),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r)),
                            ),
                            child: MediaQuery.removePadding(
                              removeTop: true,
                              context: context,
                              child: ListView(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                shrinkWrap: true,
                                children: ref
                                    .watch(genderList)
                                    .map(
                                      (gender) => Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (ref
                                                .watch(selectedGenderList)
                                                .contains(gender)) {
                                              null;
                                            } else if (ref
                                                    .watch(selectedGenderList)
                                                    .length ==
                                                1) {
                                              ref
                                                  .watch(selectedGenderList
                                                      .notifier)
                                                  .state
                                                  .clear();
                                              ref
                                                  .watch(selectedGenderList
                                                      .notifier)
                                                  .state
                                                  .add(gender);
                                              if (gender == 'Male') {
                                                ref
                                                    .watch(selectedGenderId
                                                        .notifier)
                                                    .state = 1;
                                              } else if (gender == 'Female') {
                                                ref
                                                    .watch(selectedGenderId
                                                        .notifier)
                                                    .state = 0;
                                              }
                                              setState(() {});
                                            } else {
                                              ref
                                                  .watch(selectedGenderList
                                                      .notifier)
                                                  .state
                                                  .add(gender);
                                              if (gender == 'Male') {
                                                ref
                                                    .watch(selectedGenderId
                                                        .notifier)
                                                    .state = 1;
                                              } else if (gender == 'Female') {
                                                ref
                                                    .watch(selectedGenderId
                                                        .notifier)
                                                    .state = 0;
                                              }
                                              setState(() {});
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            color: ref
                                                    .watch(selectedGenderList)
                                                    .contains(gender)
                                                ? const Color(0xff5F6998)
                                                : Colors.transparent,
                                            height: 25.h,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Text(
                                                gender,
                                                style: AppTextStyle.whiteBold
                                                    .copyWith(
                                                        fontSize: 13.5.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///Countries List
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 366.h,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: ref.watch(showAddressList) ? 127.h : 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.91),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r)),
                            ),
                            child: BlocBuilder<CountriesCubit,
                                Result<CountriesEntity>>(
                              builder: (context, state) => state.when(
                                  () => Container(),
                                  loading: () => const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      ),
                                  initial: () => Container(),
                                  error: (message, code) => Center(
                                        child: Text(
                                          message!,
                                          style:
                                              AppTextStyle.whiteBold.copyWith(
                                            fontSize: 13.5.sp,
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
                                          controller: addressScrollController,
                                          isAlwaysShown: true,
                                          thumbColor: Colors.white,
                                          radius: Radius.circular(10),
                                          child: ListView(
                                            controller: addressScrollController,
                                            physics: const BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics()),
                                            shrinkWrap: true,
                                            children: response.data
                                                .map(
                                                  (address) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.h),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                       ref.watch(selectedCountryNameCompleteRegistration.notifier).state=
                                                           address.name;
                                                       ref.watch(selectedCountryIdCompleteRegistration.notifier).state=
                                                           address.id;

                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        color:ref.watch(selectedCountryIdCompleteRegistration)==address.id
                                                            ? const Color(
                                                                0xff5F6998)
                                                            : Colors
                                                                .transparent,
                                                        height: 25.h,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                address.name,
                                                                style: AppTextStyle
                                                                    .whiteBold
                                                                    .copyWith(
                                                                        fontSize: 13.5
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w500),
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
                        ],
                      ),

                      /// Cities List
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 428.h,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: ref.watch(showCitieslist) ? 127.h : 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.91),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r)),
                            ),
                            child: BlocBuilder<GetCitiesInCountryCubit, Result<GetCitiesInCountry>>(
                              builder: (context, state) => state.when(
                                      () => Container(),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  ),
                                  initial: () => Center(
                                    child: Text('Please, Select a country first',style: AppTextStyle.appHintStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15.sp,
                                    ),),
                                  ),
                                  error: (message, code) => Center(
                                    child: Text(
                                      message!,
                                      style:
                                      AppTextStyle.whiteBold.copyWith(
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
                                          controller: addressScrollController,
                                          isAlwaysShown: true,
                                          thumbColor: Colors.white,
                                          radius: Radius.circular(10),
                                          child: ListView(
                                            controller: addressScrollController,
                                            physics: const BouncingScrollPhysics(
                                                parent:
                                                AlwaysScrollableScrollPhysics()),
                                            shrinkWrap: true,
                                            children: response.data
                                                .map(
                                                  (address) => Padding(
                                                padding:
                                                EdgeInsets.symmetric(
                                                    vertical: 7.h),
                                                child: GestureDetector(
                                                  onTap: () {
                                                   ref.watch(selectedCityNameCompleteRegistration.notifier).state=address.name;
                                                     ref.watch(selectedCityIdCompleteRegistration.notifier).state=address.id;
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: ref.watch(selectedCityIdCompleteRegistration)==address.id
                                                        ? const Color(0xff5F6998)
                                                        : Colors.transparent,
                                                    height: 25.h,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          left: 10.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            address.name,
                                                            style: AppTextStyle
                                                                .whiteBold
                                                                .copyWith(
                                                                fontSize: 13.5
                                                                    .sp,
                                                                fontWeight:
                                                                FontWeight.w500),
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
                        ],
                      ),

                      ///Services List
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          SizedBox(
                            height: 493.h,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: ref.watch(showServicesList) ? 127.h : 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.91),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r)),
                            ),
                            child: BlocBuilder<GetAllServicesCubit,
                                Result<GetAllServicesEntity>>(
                              builder: (context, state) => state.when(
                                  () => Container(),
                                  loading: () => const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      ),
                                  initial: () => Container(),
                                  error: (message, code) => Center(
                                        child: Text(
                                          message!,
                                          style:
                                              AppTextStyle.whiteBold.copyWith(
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
                                          controller:servicesScrollController,
                                          isAlwaysShown: true,
                                          thumbColor: Colors.white,
                                          radius: Radius.circular(10),
                                          child: ListView(
                                            controller:servicesScrollController,
                                            physics: const BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics(),),
                                            shrinkWrap: true,
                                            children: response.data
                                                .map(
                                                  (service) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.h),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (ref.watch(selectedServicesList).contains(service.name)) {
                                                          //ref.watch(selectedServicesList.notifier).state.remove(service.name);
                                                          //ref.watch( selectedServicesId.notifier).state!.remove(service.id);
                                                        } else {
                                                          ref.watch(selectedServicesList.notifier).state.add(service.name);
                                                          ref.watch( selectedServicesId.notifier).state.add(service.id);
                                                          print(ref.watch(selectedServicesId));
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: ref.watch(selectedServicesList) .contains(service.name)
                                                            ? const Color( 0xff5F6998)
                                                            : Colors.transparent,
                                                        height: 25.h,
                                                        child: Padding(
                                                          padding:EdgeInsets.only(left: 10.w),
                                                          child: Text(service.name,
                                                            style: AppTextStyle
                                                                .whiteBold
                                                                .copyWith(
                                                                    fontSize:
                                                                        13.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
/* AppButtons(
                                    buttonText: 'Continue',
                                    buttonColor: AppColors.primaryColor,
                                    onPressed: () {

                                      if (ref.watch(selectedLocationId) !=
                                              null &&
                                          ref.watch(selectedGenderId) != null &&
                                          ref.watch(selectedEducationIds) !=
                                              null &&
                                          ref.watch(selectedGenderId) != null &&
                                          ref.watch(selectedServicesId) !=
                                              null &&
                                          ref.watch(selectedCityIdCompleteRegistration)!=null
                                      ) {
                                        bearerTokenRetreiver().then((value1) {
                                         getUserId().then((value2) =>BlocProvider.of<AddLanguagesCubit>(context).addLanguages(
                                             content_type: "multipart/form-data; boundary=<calculated when request is sent>",
                                             bearer: "Bearer $value1",
                                             user_id: value2??0,
                                             language_ids: '${ref.watch(selectedLanguagesIdComplete)}').then((xd)=>
                                             BlocProvider.of<EditDetailsCubit>(context).editDetails(
                                           content_type:
                                           "multipart/form-data; boundary=<calculated when request is sent>",
                                           bearer_token: "Bearer $value1",
                                           user_id: value2,
                                          /* email:
                                           ref.watch(signUpEmailProvider),*/
                                           phone_number: ref.watch(
                                               phoneNumberCompleteRegistrationProvider),
                                           profile_image:
                                           ref.watch(uploadedImage),
                                           about: null,
                                           city_id: null,
                                           country_id:
                                           ref.watch(selectedLocationId),
                                           is_male:
                                           ref.watch(selectedGenderId),
                                           location: null,
                                           service_ids:"${ref.watch(selectedServicesId)}" ,
                                           education_ids: "${ref.watch(selectedEducationIds)}"
                                         )));
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    height: 52.h,
                                    width: 327.h,
                                    buttonTextStyle:
                                        AppTextStyle.buttonTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ); */
