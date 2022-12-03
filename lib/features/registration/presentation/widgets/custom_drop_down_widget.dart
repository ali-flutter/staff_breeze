import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/complete_registration_state_controller.dart';
import 'package:staff_breeze/style/app_colors.dart';

import '../../../../style/app_images.dart';
import '../../../../style/app_text_style.dart';

class CustomDropdownWidget extends StatefulWidget {
  CustomDropdownWidget(
      {Key? key,
      required this.hint,
      required this.onPressed,
      required this.selectedItem,

    //  required this.selectedItemToRemove,
       required this.remover,
        required this.listToRemoveFrom,
      })
      : super(key: key);
  String hint;
  List selectedItem;
  void Function()? onPressed;

//  String selectedItemToRemove;
  StateProvider<String> remover;
  StateProvider<List> listToRemoveFrom;
  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        return Column(
          children: [
            SizedBox(
              height: 33.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.selectedItem.isEmpty
                      ? Text(
                          widget.hint,
                          style: AppTextStyle.appHintStyle,
                        )
                      : SizedBox(
                          height: 29.h,
                          width: 280.w,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.selectedItem.length,
                            itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Chip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.r),
                                  side: const BorderSide(
                                    color: Color(0xff707070),
                                  ),
                                ),
                                label: Text(widget.selectedItem[i]),
                                elevation: 0,
                                backgroundColor: AppColors.scaffoldBackgroundColor,
                                deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                                onDeleted: (){
                                  ref.watch(widget.remover.notifier).state=widget.selectedItem[i];
                                  ref.watch(widget.listToRemoveFrom.notifier).state.remove(ref.watch(widget.remover));
                                  /*ref.watch(selectedSingleEducation.notifier).state=ref.watch(selectedEducationList)[i];
                                  ref.watch(selectedEducationList.notifier).state.remove(ref.watch(selectedSingleEducation ));
                                  print(ref.watch(selectedSingleEducation));*/
                                  setState(() {

                                  });
                                }//onDeleted,
                              ),
                            ),
                          ),
                        ),
                  IconButton(
                      onPressed: widget.onPressed,
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
        );
      }
    );
  }
}
/*selectedItem.map((e) =>
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r),
                              side:const BorderSide(

                              color: Color(0xff707070)
                            )
                          ),
                          label: Text(e),
                    elevation: 0,
                    backgroundColor: AppColors.scaffoldBackgroundColor,
                    deleteIcon: SvgPicture.asset(AppImages.chipCancel),
                          onDeleted: onDeleted,
                  ),
                      ),).toList(),*/
