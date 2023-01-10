import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../../../core/helpers/shared_prefs_manager/customer_data.dart';
import '../../../registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import '../../../registration/presentation/business_logic/controller/sign_up_state_controller.dart';

class CustomerInfoBar extends ConsumerStatefulWidget {
  const CustomerInfoBar({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  CustomerInfoBarState createState() => CustomerInfoBarState();
}

class CustomerInfoBarState extends ConsumerState<CustomerInfoBar> {
  String name = '';
  @override
  void initState() {
    customerNameRetriever().then((nameFromShard) {
      if (nameFromShard == null) {
        setState(() {
          name = '';
        });
      } else {
        setState(() {
          name = nameFromShard;
        });
      }
    });
    customerPhotoRetriever().then((customerPhotoFromShared) {
      if (customerPhotoFromShared != null) {
        print('its not null ');
        ref.watch(customerPhotoStateController.notifier).state = customerPhotoFromShared;
        print(ref.watch(customerPhotoStateController));
      } else {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Row(
        mainAxisAlignment: ref.watch(isGuestProvider) ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
        children: [
          !ref.watch(isGuestProvider)
              ? Container(
            height: 45.w,
            width: 45.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              //color:Colors.amber,// AppColors.scaffoldBackgroundColor,
              // TODO : HERE I WANT TO ADD THE REAL IMAGE OF THE CUSTOMER

              image: ref.watch(customerPhotoStateController) == ''
                  ? const DecorationImage(image: AssetImage(AppImages.placeholderImage), fit: BoxFit.cover)
                  : DecorationImage(image: NetworkImage(imagesUrl + ref.watch(customerPhotoStateController)), fit: BoxFit.cover),
            ),
          )
              : Container(),
          //SizedBox(width: 7.5.w),
          Consumer(builder: (context, ref, _) {
            //TODO HERE I WANT TO DISPLAY THE FIRST NAME OF THE CUSTOMER
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ref.watch(isGuestProvider) == false
                    ? Text(
                  'Welcome ${name},',
                  style: AppTextStyle.mediumGrey,
                )
                    : Text(
                  ' Welcome Guest,',
                  style: AppTextStyle.mediumGrey,
                ),
                SizedBox(
                  height: Sizer.h(context, 0.002),
                ),
                ref.watch(isGuestProvider)
                    ? Text(
                  ' Search for personal assistant',
                  style: AppTextStyle.blackMedium.copyWith(fontSize: 15.sp),
                )
                    : Text(
                  ' Search for personal assistant',
                  style: AppTextStyle.blackMedium.copyWith(fontSize: 15.sp),
                ),
              ],
            );
          }),
          // ref.watch(isGuestProvider)
          //     ? SizedBox(
          //         width: 68.w,
          //       )
          //     : Container(),
          // SizedBox(width: Sizer.w(context,0.006),),
          //TODO HERE I WANT TO ADD THE BILL IMAGE FUNCTIONALITY
          // TODO IMAGE OF A BILL WITH A NOTIFICATION AND WITHOUT
          Spacer(),
          GestureDetector(
            onTap: widget.onPressed,
            child: SizedBox(
              height: 33.w,
              width: 33.w,
              child: SvgPicture.asset(AppImages.drawerIcon),
            ),
          ),
        ],
      );
    });
  }
}
