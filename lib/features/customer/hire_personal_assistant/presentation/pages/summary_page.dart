import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_entity.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/business_logic/summary_payment_cubit.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../../style/app_colors.dart';
import '../../../find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';

class SummaryPage extends ConsumerStatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  SummaryPageState createState() => SummaryPageState();
}

class SummaryPageState extends ConsumerState<SummaryPage> {
  @override
  void initState() {
   getUserId().then((id) =>bearerTokenRetreiver().then((bearer) =>
       BlocProvider.of<SummaryPaymentCubit>(context).getTotalPayment(customer_id: id??0,
           assistant_id:ref.watch(chosenAssistantIdProvider)! ,
           bearer: "Bearer $bearer")) );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff757575),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 56.w,
                ),
                Text(
                  'SUMMARY',
                  style: AppTextStyle.blackBold,
                ),
              ],
            ),
            SizedBox(
              height: 43.h,
            ),
            Container(
              height: Sizer.h(context, 0.2),
              color: const Color(0xff343D58),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TOTAL BALANCE',
                      style: AppTextStyle.whiteBold.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r'$',
                          style: AppTextStyle.whiteBold.copyWith(fontSize: 34.sp),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        BlocConsumer<SummaryPaymentCubit,Result<SummaryPageEntity>>(
                          listener: (context,state)=>state.when(() => null,
                              loading: ()=>null,
                              initial:()=>null,
                              error: (e,s)=>null,
                              success: (success)=>ref.watch(totalAmmountProvider.notifier).state=success.data.total_payment??0),
                            builder: (context,state)=>state.when(
                                  () => Container(),
                              loading: ()=>CircularProgressIndicator(color: Colors.white,),
                              initial: ()=>Container(),
                              error: (e,s)=>Text(e!,style:TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w500)),
                              success:(success) {
                                    if(success is SummaryPageEntity){
                                     //ref.watch(totalAmmountProvider.notifier).state=success.data.total_payment??0000;
                                      return Text(
                                        success.data.total_payment.toString(),
                                        style: AppTextStyle.whiteBold.copyWith(fontSize: 34.sp),
                                      );
                                    }else{
                                      return Text(
                                       'Not Specified',
                                        style: AppTextStyle.whiteBold.copyWith(fontSize: 34.sp),
                                      );
                                    }
                              })
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 56.w,
                ),
                Text(
                  'REVIEW TRANSACTION',
                  style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2).withOpacity(0.56),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 56.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Text('',
                    //'Booked from MON to SAT',
                    style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),*/
                  BlocBuilder<SummaryPaymentCubit,Result<SummaryPageEntity>>(
                    builder: (context,state) =>state.when(() => Container(),
                        loading:()=>SizedBox(
                            height: 130.h,
                            width: 300.w,
                            child: Center(child: CircularProgressIndicator(color: const Color(0xff998FA2),))),
                        initial: ()=>Container(),
                        error: (e,s)=>Container(),
                        success: (success){
                        if(success is SummaryPageEntity){
                          return  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Working hour from: ${success.data.starts_at} - ${success.data.ends_at}',
                                style: AppTextStyle.mediumGrey.copyWith(
                                  color: const Color(0xff998FA2),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 2.5,
                                ),
                              ),
                          Text(
                          'Your total balance ${success.data.total_payment}',
                          style: AppTextStyle.mediumGrey.copyWith(
                          color: const Color(0xff998FA2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 2.5,
                          ),),
                            ],
                          );
                        }else{
                          return Container();
                        }
                        })
                  ),/* return Text(
                        'Working hour from: 6:35 AM - 8:22 PM',
                        style: AppTextStyle.mediumGrey.copyWith(
                          color: const Color(0xff998FA2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 2.5,
                        ),
                      );*/
                 /* BlocBuilder<SummaryPaymentCubit,Result<SummaryPageEntity>>(
                    builder: (context,state) =>state.when(() => Container(),
                        loading: ()=>, initial: initial, error: error, success: success)
                  ),*//* Text(
                        r'Your total balance $00000',
                        style: AppTextStyle.mediumGrey.copyWith(
                          color: const Color(0xff998FA2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 2.5,
                        ),
                      );*/
                  Text(
                    '+Plus APP fee.',
                    style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                AppButtons(
                  buttonText: 'MAKE A TRANSFER',
                  buttonColor: AppColors.primaryColor,
                  onPressed: () {
                   Navigator.pushNamed(context,PAYMENT_PAGE);
                    // AutoRouter.of(context).push(PaymentRoute());
                    },
                  buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                  height: 52.h,
                  width: 300.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
final totalAmmountProvider=StateProvider<int>((ref)=>0);