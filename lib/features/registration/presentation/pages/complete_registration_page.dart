import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:dotted_border/dotted_border.dart';
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
  /* final List<String> educationList = const [
    'Professional Certificates',
    'Undergraduate Degrees',
    'Transfer Degrees',
    'Associate Degrees',
    'Bachelor Degrees',
    'Graduate Degrees',
    'Master Degrees',
    'Specialist Degrees',
    'Not Applicable',
    'Other'
  ];

    final languagesList = const [
      'English',
      'French',
      'Spanish',
      'Arabic',
      'Turkish',
      'Italian',
    ];
  final genderList=const['Male','Female'];
  final addressList = const [
    'United Arab Emirates',
    'Saudi Arabia',
    'Kuwait',
    'Syria',
    'Lebanon',
    'Iraq',
    'Qatar'
  ];
  bool showEducationList = false;
  bool showLanguagesList = false;
  bool showGenderList = false;
  bool showAddressList = false;
  List<String>selectedLanguages=[];
  List<String>selectedEducations=[];
  List<String>selectedGender=[];
  List<String>selectedAddress=[];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer(builder: (context, ref, _) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 52.h,
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
                            return CustomDropdownWidget(
                              hint: 'Education',
                              remover: selectedSingleEducation,
                              listToRemoveFrom: selectedEducationList,
                              selectedItem: ref.watch(selectedEducationList),
                              onPressed: () {
                                ref.watch(showEducationList.notifier).state =
                                    !ref.watch(showEducationList);
                              },

                            );
                          }
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        Consumer(
                          builder: (context,ref,_) {
                            return CustomDropdownWidget(
                              hint: 'Languages',
                              remover: selectedSingleLanguage,
                              listToRemoveFrom:selectedLanguagesList ,
                              selectedItem: ref.watch(selectedLanguagesList),
                              onPressed: () {
                                ref.watch(showLanguagesList.notifier).state =
                                    !ref.watch(showLanguagesList);
                              },

                            );
                          }
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        CustomDropdownWidget(
                          hint: 'Gender',
                          remover: selectedSingleGender,
                          listToRemoveFrom: selectedGenderList,
                          selectedItem: ref.watch(selectedGenderList),
                          onPressed: () {
                            ref.watch(showGenderList.notifier).state =
                                !ref.watch(showGenderList);
                          },

                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        CustomDropdownWidget(
                          remover: selectedSingleAddress,
                          listToRemoveFrom: selectedAddressList,
                          hint: 'Address',
                          selectedItem: ref.watch(selectedAddressList),
                          onPressed: () {
                            ref.watch(showAddressList.notifier).state =
                                !ref.watch(showAddressList);
                          },

                        ),

                        SizedBox(
                          height: 38.h,
                        ),
                      // const TextFieldWidget(hintText: 'Phone number'),
                       CompleteRegistrationTextField(
                         hintText: 'Phone number',
                         onChanged: (c){},
                       validator: (v){},
                       ),
                        SizedBox(
                          height: 40.h,
                        ),
                        DottedBorder(
                          strokeWidth: 1.w,
                          color:const Color(0XffDDDDDD),
                          child: Container(
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
                                    Text(
                                      'Upload your photo',
                                      style: AppTextStyle.appHintStyle.copyWith(
                                          color: const Color(0xff241332)
                                              .withOpacity(.32),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
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
                                                  color:const Color(0xff707070),),
                                            ),
                                          )),
                                      onPressed: () {
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
                                                    color:
                                                        const Color(0xff352641),
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
                        AppButtons(
                          buttonText: 'Continue',
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, PERSONAL_ASSISTANT_HOMEPAGE, (route) => false);
                          },
                          height: 52.h,
                          width: 327.h,
                          buttonTextStyle:
                              AppTextStyle.buttonTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 194.h,
                      ),
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
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          children: ref.watch(educationList)
                              .map(
                                (education) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 7.h),
                                  child: InkWell(
                                    onTap: () {
                                      if (ref.watch(selectedEducationList)
                                          .contains(education)) {
                                        null;
                                      } else {
                                        ref.watch(selectedEducationList.notifier).state.add(education);
                                        setState(() {

                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      color: ref.watch(selectedEducationList).contains(education)
                                          ?const Color(0xff5F6998)
                                      :Colors.transparent,
                                      height: 25.h,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.w,top: 3.h),
                                        child: Text(
                                          education,
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
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 258.h,
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
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          children: ref.watch(languagesList)
                              .map(
                                (language) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 7.h),
                                  child: GestureDetector(
                                    onTap:(){
                                      if (ref.watch(selectedLanguagesList)
                                          .contains(language)) {
                                        null;
                                      } else {
                                        ref.watch(selectedLanguagesList.notifier).state.add(language);
                                        setState(() {

                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      color:ref.watch(selectedLanguagesList).contains(language)
                                          ?const Color(0xff5F6998): Colors.transparent,
                                      height: 25.h,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          language,
                                          style: AppTextStyle.whiteBold
                                              .copyWith(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 320.h,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: ref.watch(showGenderList) ? 100.h : 0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(.91),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r)),
                        ),
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          children: ref.watch(genderList)
                              .map(
                                (gender) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 7.h),
                                  child: GestureDetector(
                                    onTap: (){
                                      if (ref.watch(selectedGenderList)
                                          .contains(gender)) {
                                        null;
                                      } else {
                                        ref.watch(selectedGenderList.notifier).state.add(gender);
                                        setState(() {

                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      color: ref.watch(selectedGenderList).contains(gender)
                                          ?const Color(0xff5F6998)
                                          :Colors.transparent,
                                      height: 25.h,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          gender,
                                          style: AppTextStyle.whiteBold
                                              .copyWith(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 384.h,
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
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          children: ref.watch(addressList)
                              .map(
                                (address) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 7.h),
                                  child: GestureDetector(
                                    onTap: (){

                                      if (ref.watch(selectedAddressList)
                                          .contains(address)) {
                                        null;
                                      } else {
                                        ref.watch(selectedAddressList.notifier).state.add(address);
                                        setState(() {

                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      color: ref.watch(selectedAddressList).contains(address)
                                          ?Color(0xff5F6998)
                                          :Colors.transparent,
                                      height: 25.h,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          address,
                                          style: AppTextStyle.whiteBold
                                              .copyWith(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
