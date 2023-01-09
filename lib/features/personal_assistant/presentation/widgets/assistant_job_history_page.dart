import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';
import 'package:staff_breeze/features/customer/presentation/business_logic/cubit/get_customer_reservation_cubit.dart';
import 'package:staff_breeze/features/customer/presentation/widget/customer_job_history_list_item.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/controller/personal_assistant_home_page_state_controller.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/get_assistant_reservation_cubit.dart';
import '../../../../core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import '../../../../core/helpers/shared_prefs_manager/user_id_saver.dart';
import '../../../../core/network_configration/result.dart';
import '../../../../style/app_colors.dart';
import '../../../../style/app_text_style.dart';
import '../../domain/entity/schedule_entity/get_assistant_reservation_entity.dart';
class AssistantJobHistoryPage extends StatefulWidget {
  const AssistantJobHistoryPage({Key? key}) : super(key: key);

  @override
  State<AssistantJobHistoryPage> createState() => _AssistantJobHistoryPageState();
}

class _AssistantJobHistoryPageState extends State<AssistantJobHistoryPage> {
  String? token;
  @override
  void initState() {
    getUserId().then((value1) {
      return bearerTokenRetreiver().then((
          value2) =>  BlocProvider.of<GetAssistantReservationCubit>(context).getAssistantReservation(
          bearer_token:"Bearer $value2",
          assistant_id: "$value1") );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back,
            color: Color(0xff707070),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Job History',
                style: AppTextStyle.blackBold.copyWith(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 654.h,
                width: double.infinity,
                color: Color(0xff181928),
                child: BlocBuilder<GetAssistantReservationCubit,Result<GetAssistantReservationEntity>>(
                  builder: (context,state)=>state.when(() => Container(),
                      loading: ()=>Container(
                        width: MediaQuery.of(context).size.width*1,
                        color:const Color(0xff181928),
                        child:const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )
                        ),
                      ), initial: ()=>Container(),
                      error: (e,s)=>Container(
                        width: MediaQuery.of(context).size.width*1,
                        color:const Color(0xff181928),
                        child: Center(
                          child: Text('$e'??'Something went wrong',
                            style:AppTextStyle.whiteBold ,
                          ),
                        ),
                      ), success: (response){
                        if(response is GetAssistantReservationEntity && response.data.isNotEmpty){
                          return Padding(
                            padding:  EdgeInsets.only(top:20.h),
                            child: ListView.builder(
                                physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                scrollDirection: Axis.vertical,
                                itemCount: response.data.length,
                                itemBuilder: (context,i)=>JobHistoryListItem(
                                    image: response.data[i].customer.profileImage,
                                    name:  response.data[i].customer.name,
                                    dates: response.data[i].reservation_dates)),
                          );
                        }else{
                          return Container(
                            width: MediaQuery.of(context).size.width*1,
                            color:const Color(0xff181928),
                            child: Center(
                              child: Text('Your Job history is empty',
                                style:AppTextStyle.whiteBold ,
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}