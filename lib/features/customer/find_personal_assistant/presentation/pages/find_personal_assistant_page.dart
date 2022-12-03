import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/customer_info_bar.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/search_filters_assistants.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../../../../router/app_routes.dart';
import '../widget/customer_drawer.dart';

class FindPersonalAssistant extends StatefulWidget {
  const FindPersonalAssistant({Key? key}) : super(key: key);

  @override
  State<FindPersonalAssistant> createState() => _FindPersonalAssistantState();
}

class _FindPersonalAssistantState extends State<FindPersonalAssistant> {
  bool keyboardState = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      setState(() {
        keyboardState = true;
      });
      print('keyboardState IS $keyboardState');
    } else {
      setState(() {
        keyboardState = false;
      });
      print(keyboardState);
    }
  }
  GlobalKey<ScaffoldState>_key=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CustomerDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !keyboardState
          ? GestureDetector(
        onTap: (){Navigator.of(context).pushNamed(CUSTOMER_PROFILE);},
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
          )
          : null,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        color: AppColors.scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70.h,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.04)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Sizer.h(context, 0.05),
                ),
                CustomerInfoBar(
                  onPressed: (){

                  _key.currentState!.openDrawer();

                  },
                ),
                SizedBox(
                  height: Sizer.h(context, 0.03),
                ),
                const SearchFiltersAndPersonalAssistantList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
