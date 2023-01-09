import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/customer_data.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/find%20personal_assistant_state_controller.dart';
import 'package:staff_breeze/features/customer/presentation/widget/customer_info_bar.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/search_filters_assistants.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../../router/app_routes.dart';
import '../../../../registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import '../../../presentation/widget/customer_drawer.dart';

class FindPersonalAssistant extends ConsumerStatefulWidget {
  const FindPersonalAssistant({Key? key}) : super(key: key);

  FindPersonalAssistantState createState() =>FindPersonalAssistantState();
}

@override
class FindPersonalAssistantState extends ConsumerState<FindPersonalAssistant> {

  List<String> genders = ['Male', 'Female'];

  List<String> rate = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Star'];
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  void initState() {
   customerPhotoRetriever().then(
           (customerPhoto) {
             if(customerPhoto!=null){
               ref.watch(customerPhotoStateController.notifier).state=customerPhoto;
               print(ref.watch(customerPhotoStateController));
             }else{

             }
           });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer:const  CustomerDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? Container()
          : Consumer(
            builder: (context,ref,_) {
              return GestureDetector(
                  onTap:ref.watch(isGuestProvider)?null :() {
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
                );
            }
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
                padding: EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.04)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Sizer.h(context, 0.05)),
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
                      const SearchFiltersAndPersonalAssistantList(),
                      //  PersonalAssistantGridView(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
