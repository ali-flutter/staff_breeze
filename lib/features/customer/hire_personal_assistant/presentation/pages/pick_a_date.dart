import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/bottom_bar.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/create_reservation_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_free_days_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/create_reservation_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/business_logic/payment_state_controller.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/widgets/calendar_date_widget.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/controller/schedule_state_controller.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/get_free_days_cubit.dart';
import 'package:staff_breeze/router/app_routes.dart';

import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:status_alert/status_alert.dart';

import '../../../../../injection_container/injection.dart';
import '../../../../../style/app_images.dart';
import '../../../../../style/dimensions_controller.dart';
import '../widgets/calender_widget.dart';

class PickDatePage extends ConsumerStatefulWidget {
  const PickDatePage({Key? key}) : super(key: key);

  @override
  PickDatePageState createState() => PickDatePageState();
}

class PickDatePageState extends ConsumerState<PickDatePage> {
  List<String> months = [
    'JANUARY',
    'February',
    'March',
    'April',
    'May',
    'june',
    'july',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int currentMonthNumber = DateTime.now().month;

  final snackBar =
      SnackBar(duration: Duration(seconds: 1), content: Text("date selected"));

  @override
  void initState() {
    bearerTokenRetreiver().then((bearer) =>
        BlocProvider.of<GetFreeDaysCubit>(context).getFreeDays(
            user_id: ref.watch(chosenAssistantIdProvider) ?? 0,
            bearer_token: "Bearer $bearer"));

    super.initState();
  }

  final formatter = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          //();
          Navigator.pushNamed(context, SUMMARY_PAGE);
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
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        color: AppColors.scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 30.h,
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
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
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 56.w,
                  ),
                  Text(
                    'PICK A DATE',
                    style: AppTextStyle.blackBold,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Flexible(
                child: Container(
                    color: const Color(0xff343D58),
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 56.w),
                          child: Text(
                            months[currentMonthNumber - 1],
                            style: AppTextStyle.whiteBold
                                .copyWith(fontSize: 26.sp),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),

                        BlocBuilder<GetFreeDaysCubit,Result<GetFreeDaysEntity>>(
                          builder: (context, state) => state.when(
                              () => Container(),
                              loading: () => Container(
                                    height: 260.h,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              initial: () => Container(),
                              error: (e, s) =>Container(
                                height: 200.h,
                                width: double.infinity,
                                color: Color(0xff343D58),
                                child: Column(
                                  children: [
                                    Text(e.toString(),style: AppTextStyle.whiteBold,),
                                   SizedBox(height: 40.h,),
                                    ElevatedButton(onPressed: (){}, child:Text('Retry',style: AppTextStyle.whiteBold.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),))
                                  ],
                                ),
                              ),
                              success: (response) {
                                print('im in the success');
                                if (response is GetFreeDaysEntity &&
                                response.data.first_month_dates != null &&
                                    response.data.first_month_dates!.isNotEmpty) {
                                   List firstMonthDates=response.data.first_month_dates!.map((e) => DateTime.parse(e)).toList();
                                  return CalendarDateWidget(
                                    selectableDayPredicate: (d){
                                      if(firstMonthDates.contains(d)){
                                        return true;
                                      }else{
                                        return false;
                                      }
                                    },
                                    onValueChanged: (d) {
                                      print('afjsdkl');

                                      print(d);
                                      ref.watch(selectedFreeDaysForReservation.notifier).state=d;
                                      print('this is selectedFreeDaysForReservation ${ref
                                          .watch(
                                          selectedFreeDaysForReservation)}');
                                      /*print(d);
                                      print(d.last!.isBefore(DateTime.now()));
                                      setState(() {
                                        if (d.last!.isBefore(DateTime.now())) {
                                          print(d[d.length - 1]);
                                          d.removeAt(d.length - 1);
                                          print(d.last);
                                        }
                                      });
                                      print(d.last);
                                   */ },
                                    firstDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        1),
                                    lastDate: DateTime(DateTime.now().year,
                                        DateTime.now().month,
                                        30),
                                    initialValues: [
                                      /*...response.data.free_days!
                                          .map((e) => DateTime.parse(
                                              '${e.substring(6)}-${e.substring(0, 2)}-${e.substring(3, 5)}')).where((element) => element.isAfter(DateTime.now()))
                                          .toList()*/
                                    ],
                                    /*   response.data.free_days!.map(
                                      (e) {
                                        */ /*  print(DateTime.parse('${e.substring(6)}-${e.substring(0,2)}-${e.substring(3,5)}'));*/ /*
                                        return DateTime.parse(
                                            '${e.substring(6)}-${e.substring(0, 2)}-${e.substring(3, 5)}');
                                      },
                                    ).toList(),*/
                                  );
                                } else {
                                  print('im in the else');
                                  return CalendarDateWidget(
                                    selectableDayPredicate: (d){
                                      return false;
                                    },
                                    onValueChanged: (d) {
                                      ref.watch(selectedFreeDaysForReservation.notifier).state=d;
                                      print('this is selectedFreeDaysForReservation ${ref
                                          .watch(
                                          selectedFreeDaysForReservation)}');
                                    },
                                    // dayBuilder: (DateTime.now(),){},
                                    firstDate: DateTime(DateTime.now().year,
                                        DateTime.now().month, 1),
                                    lastDate: DateTime(DateTime.now().year,
                                        DateTime.now().month, 30),
                                    initialValues: [],
                                  );
                                }
                              }),
                        ),
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.1),
                          thickness: 1.h,
                        ),

                        ///START OF THE SECOND CALENDER WIDGET {THE NEXT MONTH}

                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 56.w),
                          child: Text(
                            currentMonthNumber == 12
                                ? 'January'
                                : months[currentMonthNumber],
                            style: AppTextStyle.whiteBold
                                .copyWith(fontSize: 26.sp),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        BlocBuilder<GetFreeDaysCubit,
                            Result<GetFreeDaysEntity>>(
                          builder: (context, state) => state.when(
                                  () => Container(),
                              loading: () => Container(
                                height: 260.h,
                                width:
                                MediaQuery.of(context).size.width * 1,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              initial: () => Container(),
                              error: (e, s) => Container(
                                height: 200.h,
                                width: double.infinity,
                                color: Color(0xff343D58),
                                child: Column(
                                  children: [
                                    Text(e.toString(),style: AppTextStyle.whiteBold,),
                                    SizedBox(height: 40.h,),
                                    ElevatedButton(onPressed: (){}, child:Text('Retry',style: AppTextStyle.whiteBold.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),))
                                  ],
                                ),
                              ),
                              success: (response) {
                                print('object');
                                if (response is GetFreeDaysEntity &&
                                    response.data.first_month_dates != null &&
                                    response.data.first_month_dates!.isNotEmpty) {
                                  List secondMonthDates=response.data.second_month_dates!.map(
                                          (e) =>DateTime.parse(e) ).toList();

                                  return CalendarDateWidget(
                                    selectableDayPredicate: (s){
                                      if(secondMonthDates.contains(s)){
                                      //  ref.watch(selectedFreeDaysForReservation.notifier).state=s;
                                        print('this is the $s');
                                        return true;

                                      }else{
                                        return false;
                                      }
                                      },
                                    onValueChanged: (d) {
                                      ref.watch(selectedFreeDaysForSecondMonth.notifier).state=d;
                                      print('this is selectedFreeDaysForReservation ${ref
                                          .watch(
                                          selectedFreeDaysForSecondMonth)}');
                                    },
                                    firstDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month + 1,
                                        1),
                                    lastDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month + 1,
                                      DateTime.parse(response.data.second_month_dates!.last).day),
                                    initialValues: [],

                                  );
                                } else {
                                  print('dfskjhkfah');
                                  return CalendarDateWidget(
                                     selectableDayPredicate: (d){
                                       return false;
                                     },
                                    onValueChanged: (d) {  ref.watch(selectedFreeDaysForSecondMonth.notifier).state=d;
                                    print('this is selectedFreeDaysForReservation ${ref
                                        .watch(
                                        selectedFreeDaysForSecondMonth)}');},
                                    // dayBuilder: (DateTime.now(),){},
                                    firstDate: DateTime(
                                        DateTime.now().month == 12?
                                        DateTime.now().year
                                            :DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month + 1,
                                        1),
                                    lastDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month + 1,
                                        30),
                                    initialValues: [],
                                  );
                                }
                              }),
                        ),
                        /*     BlocBuilder<GetFreeDaysCubit,
                            Result<GetFreeDaysEntity>>(
                          builder: (context, state) => state.when(
                              () => Container(),
                              loading: () => Container(
                                    height: 260.h,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              initial: () => Container(),
                              error: (e, s) => CalendarDateWidget(

                                    firstDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month +
                                                1 */ /*DateTime.now().month+1*/ /*,
                                        10),
                                    lastDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month + 1,
                                        30),
                                    initialValues: [],

                                  ),
                              success: (response) {
                                if (response is GetFreeDaysEntity &&
                                    response.data.free_days != null &&
                                    response.data.free_days!.isNotEmpty) {
                                  return CalendarDateWidget(
                                            */ /*(date: ,decoration: ,isDisabled: ,isSelected: ,
                                                isToday:,
                                            textStyle: )*/ /*
                                    firstDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month +
                                                1 */ /*DateTime.now().month+1*/ /*,
                                        1),
                                    lastDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month == 12
                                            ? 1
                                            : DateTime.now().month + 1,
                                        30),
                                    initialValues:[...response.data.free_days!.map((e)=>DateTime.parse(
                                        '${e.substring(6)}-${e.substring(0, 2)}-${e.substring(3, 5)}')).toList()],
                                     */ /*   response.data.free_days!.map(
                                      (e) {

                                        return DateTime.parse(
                                            '${e.substring(6)}-${e.substring(0, 2)}-${e.substring(3, 5)}');

                                      },
                                    ).toList(),*/ /*
                                  );
                                } else {
                                  return CalendarDateWidget(

                                    firstDate: DateTime(DateTime.now().year,
                                        DateTime.now().month, 1),
                                    lastDate: DateTime(DateTime.now().year,
                                        DateTime.now().month, 30),
                                    initialValues: [],
                                  );
                                }
                              }),
                        ),*/
                        /*    BlocBuilder<GetFreeDaysCubit,
                                Result<GetFreeDaysEntity>>(
                            builder: (context, state) {
                          return CalendarDateWidget(
                            firstDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month == 12
                                    ? 1
                                    : DateTime.now().month +
                                        1 */ /*DateTime.now().month+1*/ /*,
                                1),
                            lastDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month == 12
                                    ? 1
                                    : DateTime.now().month + 1,
                                30),
                            initialValues: [],
                          );
                        }),*/
                        Divider(
                          color: Color(0xffFFFFFF).withOpacity(0.1),
                          thickness: 1.h,
                        ),
                      ],
                    ) //const SizedBox(),//CalendarWidget(),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // user must tap button!
      builder: (BuildContext context) {
        return BlocProvider<CreateReservationCubit>.value(
          value: getIt<CreateReservationCubit>(),
          child: AlertDialog(
            backgroundColor: AppColors.primaryColor.withOpacity(.91),
            title: Text(
              'Create Reservation with ${ref.watch(chosenPersonalAssistantName)}',
              style: const TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Text('Selected Days :',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 40.h,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => Text(
                              formatter.format(
                                  ref.watch(selectedDatesProvider)[i] ??
                                      DateTime.now()),
                              style: TextStyle(color: Colors.white),
                            ),
                        separatorBuilder: (context, i) => const Text(
                              '   /   ',
                              style: TextStyle(color: Colors.white),
                            ),
                        itemCount: ref.watch(selectedDatesProvider).length),
                  )
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
              BlocConsumer<CreateReservationCubit,
                      Result<CreateReservationEntity>>(
                  listener: (context, state) => state.when(() => null,
                      loading: () => null,
                      initial: () => null,
                      error: (e, s) => AppDialogs.errorDialog(context,
                              error: e ?? 'Something went wrong',
                              onConfirmBtnTap: () {
                            getUserId().then((id) => bearerTokenRetreiver()
                                .then((bearer) => BlocProvider.of<
                                        CreateReservationCubit>(context)
                                    .createReservation(
                                        bearer_token: "Bearer $bearer",
                                        customer_id: id ?? 0,
                                        assistant_id: ref.watch(
                                                chosenAssistantIdProvider) ??
                                            0,
                                        reservations_dates: ref
                                            .watch(selectedDatesProvider)
                                            .map((e) => formatter.format(e!))
                                            .toList())));
                          }),
                      success: (response) {
                        /* if(response is CreateReservationEntity && response.code=='500'){
                          Navigator.pop(context);

                          return AppDialogs.errorDialog(context,
                              error: response.message.error[0]?? 'Something went wrong',
                              onConfirmBtnTap: (){
                               Navigator.pop(context);
                              });
                        }else if(response is CreateReservationEntity && response.code=='422'){
                          print('got you');
                          Navigator.pop(context);
                         return AppDialogs.errorDialog(
                             context,
                              error: 'you didn\'t select any dates'?? 'Something went wrong',
                              onConfirmBtnTap: (){
                                Navigator.pop(context);
                               */ /* getUserId() .then((id)=>bearerTokenRetreiver().then((bearer) =>
                                    BlocProvider.of<CreateReservationCubit>(context).createReservation(
                                        bearer_token:"Bearer $bearer",
                                        customer_id: id??0,
                                        assistant_id:ref.watch(chosenAssistantIdProvider)??0 ,
                                        reservations_dates: ref.watch(selectedDatesProvider).map((e) => formatter.format(e!)).toList()
                                    )));*/ /*
                              });
                        }
                        StatusAlert.show(context,title: "Reservation Created Successfully",
                          configuration: IconConfiguration(icon:Icons.done),
                          subtitle: "You made a reservation with ${ref.watch(chosenPersonalAssistantName)} "

                        );
*/
                        Navigator.pop(context);
                      }),
                  builder: (context, state) {
                    if (state is Loading) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    } else {
                      return TextButton(
                        child: const Text(
                          'Create',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          getUserId().then((id) => bearerTokenRetreiver().then(
                              (bearer) =>
                                  BlocProvider.of<CreateReservationCubit>(
                                          context)
                                      .createReservation(
                                          bearer_token: "Bearer $bearer",
                                          customer_id: id ?? 0,
                                          assistant_id: ref.watch(
                                                  chosenAssistantIdProvider) ??
                                              0,
                                          reservations_dates: ref
                                              .watch(selectedDatesProvider)
                                              .map((e) => formatter.format(e!))
                                              .toList())));
                        },
                      );
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
