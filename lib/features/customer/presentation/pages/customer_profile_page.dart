import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/customer_data.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/edit_name_profile_image.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_about_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/add_about_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/get_customer_info_cubit.dart';
import 'package:staff_breeze/features/customer/presentation/business_logic/cubit/edit_name_profile_image_cubit.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import '../../../../core/network_configration/result.dart';
import '../../../../core/network_configration/result.dart';
import '../../../../router/app_routes.dart';
import '../../../../style/app_images.dart';
import '../../../personal_assistant/presentation/business_logic/controller/personal_assistant_home_page_state_controller.dart';
import '../../../registration/presentation/business_logic/controller/uploading_image_functionality.dart';
import '../../find_personal_assistant/presentation/business_logic/statecontroller/find personal_assistant_state_controller.dart';
import '../../find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import '../business_logic/controller/customer_homepage_state.dart';

class CustomerProfilePage extends ConsumerStatefulWidget {
  const CustomerProfilePage({Key? key}) : super(key: key);

  @override
  CustomerProfilePageState createState() => CustomerProfilePageState();
}

class CustomerProfilePageState extends ConsumerState<CustomerProfilePage> {
  @override
  void initState() {
    getUserId().then((value) => BlocProvider.of<GetCustomerInfoCubit>(context).getCustomerInfo(user_id: value ?? 0));
    super.initState();
  }

  final snackBar = SnackBar(
    backgroundColor: const Color(0xff343D58),
    duration: const Duration(seconds: 1),
    content: Text(
      'About Me added successfully',
      style: AppTextStyle.whiteBold.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCustomerInfoCubit, Result<GetCustomerInfoEntity>>(
        builder: (context, state) => state.when(
              () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          initial: () => Container(),
          error: (e, s) => Center(
            child: Text(
              e ?? 'Something went wrong',
              style: AppTextStyle.whiteBold.copyWith(
                fontSize: 18.sp,
              ),
            ),
          ),
          success: (success) {
            if (success is GetCustomerInfoEntity) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Consumer(builder: (context, ref, _) {
                      return Container(
                        height: MediaQuery.of(context).padding.top * 10.4,
                        width: 375.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          image: success.data.profileImage == "" || success.data.profileImage == null
                              ? const DecorationImage(image: AssetImage(AppImages.placeholderImage), fit: BoxFit.cover)
                          /* : ref.watch(customerUploadedImageProvider)!=null&&ref.watch(customerUploadedImageProvider)!=''
                                ''?DecorationImage(
                                    image: NetworkImage(
                                        imagesUrl + ref.watch(customerUploadedImageProvider)!),
                                    fit: BoxFit.cover)*/
                              : DecorationImage(image: NetworkImage(imagesUrl + success.data.profileImage!), fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 174.w,
                                  height: 53.h,
                                  child: Text(
                                    success.data.name ?? 'customer',
                                    style: AppTextStyle.whiteBold.copyWith(
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                ),
                                Consumer(builder: (context, ref, _) {
                                  return GestureDetector(
                                    onTap: () {
                                      _showMyDialog(ref) /*.then((value) =>getUserId().then((id) => BlocProvider.of<GetCustomerInfoCubit>(context).getCustomerInfo(user_id: id??0)))*/;
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff343D58),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(AppImages.pen),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 26.h,
                            ),
                          ],
                        ),
                      );
                    }),
                    Container(
                      width: 375.w,
                      height: 497.5.h,
                      color: const Color(0xff181928),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 27.h,
                          ),
                          Container(
                            height: 44.h,
                            width: 208.53.w,
                            decoration: BoxDecoration(
                              color: Color(0xff515A75),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                              child: AppButtons(
                                width: 158.w,
                                height: 36.h,
                                onPressed: () {},
                                buttonColor: AppColors.primaryColor,
                                buttonText: 'ABOUT ME',
                                buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                          Container(
                            height: (285.88).h,
                            width: 344.w,
                            decoration: BoxDecoration(color: const Color(0xff515A75), borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 29.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 29.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        'About Me',
                                        style: AppTextStyle.appHintStyle.copyWith(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Card(
                                    color: const Color(0xff515A75),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    elevation: 0,
                                    child: SizedBox(
                                      height: 134.h,
                                      //: 316.w,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                                          child: Consumer(builder: (context, ref, _) {
                                            return TextFormField(
                                              style: AppTextStyle.appHintStyle.copyWith(
                                                color: Colors.white,
                                              ),
                                              decoration: InputDecoration(
                                                hintStyle: AppTextStyle.appHintStyle.copyWith(color: Colors.white),
                                                hintText: success.data.about ?? '',
                                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                              ),
                                              onChanged: (aboutV) {
                                                ref.watch(customerAboutMeProvider.notifier).state = aboutV;
                                              },
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Consumer(builder: (context, ref, _) {
                                    return BlocConsumer<AddAboutCubit, Result<AddAboutEntity>>(
                                        listener: (context, state) => state.when(() => null,
                                            loading: () => null,
                                            initial: () => null,
                                            error: (error, s) => AppDialogs.errorDialog(context, error: error ?? 'Something went wrong', onConfirmBtnTap: () {
                                              bearerTokenRetreiver().then((bearer) => getUserId().then((id) =>
                                                  BlocProvider.of<AddAboutCubit>(context).addAbout(bearer_token: "Bearer $bearer", user_id: id ?? 0, about: ref.watch(customerAboutMeProvider))));
                                            }),
                                            success: (response) => ScaffoldMessenger.of(context).showSnackBar(snackBar)),
                                        builder: (context, state) {
                                          if (state is Loading) {
                                            return const CircularProgressIndicator(
                                              color: Colors.white,
                                            );
                                          } else {
                                            return AppButtons(
                                              buttonText: 'SAVE CHANGES',
                                              buttonColor: AppColors.primaryColor,
                                              onPressed: () {
                                                ref.watch(isGuestProvider)
                                                    ? AppDialogs.warningDialog(context, warning: "Please, you should register first", onConfirmBtnTapped: () {
                                                  Navigator.pushNamed(context, REGISTER);
                                                })
                                                    : bearerTokenRetreiver().then((value) => getUserId().then((id) =>
                                                    BlocProvider.of<AddAboutCubit>(context).addAbout(bearer_token: "Bearer $value", user_id: id ?? 0, about: ref.watch(customerAboutMeProvider))));
                                              },
                                              height: 36.h,
                                              width: 158.w,
                                              buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
                                            );
                                          }
                                        });
                                  })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Text(
                'Unexpected Error, please try again later,',
                style: AppTextStyle.whiteBold,
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _showMyDialog(WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return BlocProvider<EditNameProfileImageCubit>.value(
          value: getIt<EditNameProfileImageCubit>(),
          child: AlertDialog(
            backgroundColor: AppColors.primaryColor.withOpacity(.91),
            title: const Text(
              'Edit your Details',
              style: TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Text(
                    'Edit your name',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    elevation: 0,
                    child: SizedBox(
                      height: 40.h,
                      //: 316.w,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Consumer(builder: (context, ref, _) {
                            return TextFormField(
                              style: AppTextStyle.appHintStyle.copyWith(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                                border: UnderlineInputBorder(borderSide: BorderSide.none),
                              ),
                              onChanged: (newName) {
                                ref.watch(customerNewNameProvider.notifier).state = newName;
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ref.watch(uploadingAnImageStatus),
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  side: BorderSide(
                                    width: 1.h,
                                    color: const Color(0xff707070),
                                  ),
                                ),
                              )),
                          onPressed: () async {
                            ref.watch(customerUploadedImageProvider.notifier).state = await UploadingAnImage.pickImage(source: ImageSource.gallery) ?? '';
                            ref.watch(customerUploadedImageProvider) != null && ref.watch(customerUploadedImageProvider) != ''
                                ? ref.watch(uploadingAnImageStatus.notifier).state = 'Uploaded ✓'
                                : "Upload a photo";

                            print('pressed');
                          },
                          child: SizedBox(
                            height: 22.h,
                            width: 59.w,
                            child: Center(
                              child: Text(
                                'SELECT FILE',
                                style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff352641), fontSize: 6.sp, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ref.watch(loading) == true
                  ? CircularProgressIndicator()
                  : TextButton(
                child: const Text('Edit', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  dynamic x = await changeNameAndImage();
                  if (x == '200') {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, CUSTOMER_PROFILE);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  final Dio _dio = Dio();

  Future changeNameAndImage() async {
    print('asasasdasd');
    ref.watch(loading.notifier).state = true;

    dynamic userID = await getUserId();
    dynamic token = await bearerTokenRetreiver();
    _dio.options.headers["Authorization"] = "Bearer ${token}";
    try {
      Response response = await _dio.post(
        'https://staffbreeze.aratech.co/api/edit-image-name',
        data: {
          'user_id': '$userID',
          'name': ref.watch(customerNewNameProvider) ?? '-',
          'profile_image': ref.watch(customerUploadedImageProvider),
        },
      );
      print('response: ${response.data}');
      // setState(() {
      //   status = 'done';
      // });
      ref.watch(loading.notifier).state = false;

      var x = response.data['code'];
      print(x.toString());
      if (x == '200')
        return '200';
      else
        return AppDialogs.warningDialog(context, warning: 'Error Happened', onConfirmBtnTapped: () {
          Navigator.pop(context);
        });
      //   print(customerModel.name);
    } on DioError catch (e) {
      ref.watch(loading.notifier).state = false;

      // if (e.error is SocketException) {
      //   return AppDialogs.errorDialog(context, error: 'An error happened', onConfirmBtnTap: () {
      //     print('ok');
      //   });
      // }
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        return AppDialogs.errorDialogWithOutConfirmButton(
          context,
          error: 'An error happened',
        );
      }
    }
  }
}
