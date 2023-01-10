import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/notificatios_model.dart';
import 'package:staff_breeze/features/customer/presentation/widget/customer_job_history_list_item.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/notifications/hire_notification.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../business_logic/controller/notification_state_controller.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends ConsumerState<NotificationsPage> {
  @override
  void initState() {
    //  ref.watch(isHireButtonTapped)=true;
    getReviewsNotifications();

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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff707070),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Notifications',
                style: AppTextStyle.blackBold.copyWith(
                  fontSize: 26.sp,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Consumer(builder: (context, ref, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtons(
                        buttonText: 'Hire',
                        buttonTextStyle: ref.watch(isHireButtonTapped)
                            ? AppTextStyle.buttonTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        )
                            : AppTextStyle.buttonTextStyle.copyWith(
                          color: const Color(0xff998FA2).withOpacity(0.6),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        buttonColor: ref.watch(isHireButtonTapped) ? AppColors.primaryColor : AppColors.scaffoldBackgroundColor,
                        onPressed: () async {
                          ref.watch(isHireButtonTapped.notifier).state = true;
                          setState(() {
                            url = 'https://staffbreeze.aratech.co/api/get-reservations-notifications';
                          });
                          await getReviewsNotifications();
                        },
                        height: 32.h,
                        width: 81.w),
                    AppButtons(
                      buttonText: 'Review',
                      buttonTextStyle: ref.watch(isHireButtonTapped) == false
                          ? AppTextStyle.buttonTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      )
                          : AppTextStyle.buttonTextStyle.copyWith(
                        color: const Color(0xff998FA2).withOpacity(0.6),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      buttonColor: ref.watch(isHireButtonTapped) ? AppColors.scaffoldBackgroundColor : AppColors.primaryColor,
                      onPressed: () async {
                        ref.watch(isHireButtonTapped.notifier).state = false;

                        setState(() {
                          url = 'https://staffbreeze.aratech.co/api/get-reviews-notifications';
                        });
                        await getReviewsNotifications();
                      },
                      height: 32.h,
                      width: 81.w,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              status == 'loading'
                  ? Flexible(child: Center(child: CircularProgressIndicator()))
                  : Flexible(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemCount: notificationsList.length,
                    itemBuilder: (context, i) => JobHistoryListItem(
                        image: notificationsList[i].senderImage == null ? '' : 'https://staffbreeze.aratech.co/storage/' + notificationsList[i].senderImage!,
                        name: notificationsList[i].title!,
                        dates: [notificationsList[i].createdAt!]),
                    separatorBuilder: (context, i) => Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  String url = 'https://staffbreeze.aratech.co/api/get-reservations-notifications';

  final Dio _dio = Dio();
  String status = 'success';
  List<NotificationModel> notificationsList = [];
  Future getReviewsNotifications() async {
    notificationsList.clear();
    // CustomerModel? user;
    setState(() {
      status = 'loading';
    });
    try {
      dynamic token = await bearerTokenRetreiver();
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await _dio.get(
        "$url",
      );
      print('response: ${response.data}');

      notificationsList = List<NotificationModel>.from(response.data['data'].map((x) => NotificationModel.fromJson(x)).toList());

      //   print(customerModel.name);
    } on DioError catch (e) {
      setState(() {
        status = 'error';
      });
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
    setState(() {
      status = 'done';
    });
    return '200';
  }
}

class NotificationWidget extends StatelessWidget {
  NotificationWidget({
    this.url,
    this.body,
    this.time,
    Key? key,
    this.notificationsList,
  }) : super(key: key);

  final List<NotificationModel>? notificationsList;
  String? url;
  String? time;

  String? body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.w),
          child: Container(
            height: 66.w,
            width: 66.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('asdasd'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Text(body!),
            Text(time!),
          ],
        ),
      ],
    );
  }
}
