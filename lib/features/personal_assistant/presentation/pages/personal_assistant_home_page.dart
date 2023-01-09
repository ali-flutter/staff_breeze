import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/app_drawer.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/perosnal_assistant_home_page_entity.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/controller/personal_assistant_home_page_state_controller.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/personal_assistant_home_page_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/personal_assistants_home_page_widgets/about_me_section.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/personal_assistants_home_page_widgets/notification_schedule.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/personal_assistants_home_page_widgets/reviews_section.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_up_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/style/app_colors.dart';
import '../../../../core/network_configration/base_network_config.dart';
import '../../../../style/app_images.dart';
import '../../../../style/app_text_style.dart';

class PersonalAssistantHomePage extends ConsumerStatefulWidget {
  const PersonalAssistantHomePage({Key? key}) : super(key: key);

  @override
  PersonalAssistantHomePageState createState() =>
      PersonalAssistantHomePageState();
}

class PersonalAssistantHomePageState
    extends ConsumerState<PersonalAssistantHomePage>
    with TickerProviderStateMixin {
  TextEditingController dialogFieldController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();
  int? userId;

  @override
  void initState() {
    super.initState();
    getUserId().then((value) {
      if (value == null) {
        return null;
      }
      userId = value;
      return BlocProvider.of<PersonalAssistantHomePageCubit>(context)
          .getPersonalAssistant(id: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawerEnableOpenDragGesture: false,
      key: _key,
      drawer: AppDrawer(
         name: ref.watch(personalDrawerName),
        profileImage: ref.watch(personalDrawerPhoto),
      ),
      body: Column(
        children: [
          BlocConsumer<PersonalAssistantHomePageCubit,
              Result<PersonalAssistantHomePageEntity>>(
            listener: (context,state)=>state.when(() => null, loading: ()=>null,
                initial: ()=>null,
                error: (e,s)=>null,
                success: (success){
              if(success is PersonalAssistantHomePageEntity){
                ref.watch(personalDrawerName.notifier).state=success.data.name??"Personal Assistant";
                ref.watch(personalDrawerPhoto.notifier).state=success.data.profile_image??'';
              }
                }),
            builder: (context, state) => state.when(() => Container(),
                loading: () => Container(
                      color: AppColors.primaryColor,
                      height: MediaQuery.of(context).padding.top + 300.h,
                      width: MediaQuery.of(context).size.width * 1,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                initial: () => Container(),
                error: (message, code) => Container(
                      color: AppColors.primaryColor,
                      height: MediaQuery.of(context).padding.top + 300.h,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              message!,
                              style: AppTextStyle.whiteBold.copyWith(
                                  fontSize: 18.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ElevatedButton(
                              child: const Text('Retry'),
                              onPressed: () {
                                BlocProvider.of<PersonalAssistantHomePageCubit>(
                                        context)
                                    .getPersonalAssistant(id: userId!);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                success: (response) {
                  if (response is PersonalAssistantHomePageEntity) {

                    return Stack(
                      children: [
                        Container(
                          color: AppColors.primaryColor,
                          height: MediaQuery.of(context).padding.top + 300.h,
                          width: MediaQuery.of(context).size.width * 1,
                          child: response.data.profile_image != null
                              ? Image.network(
                                  imagesUrl+response.data.profile_image!.trim(),
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  AppImages.placeholderImage,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Container(
                          height: MediaQuery.of(context).padding.top + 300.h,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // edit profile icon row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                          AppImages.edit_profile_icon),
                                      onPressed: () {
                                        _key.currentState!.openDrawer();
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(height: 130.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Consumer(builder: (context, ref, _) {
                                      return BlocBuilder<PersonalAssistantHomePageCubit,
                                          Result<
                                              PersonalAssistantHomePageEntity>>(
                                        builder: (context, state) => state.when(
                                            () => Container(),
                                            loading: () => Container(),
                                            initial: () => Container(),
                                            error: (error, s) => Container(),
                                            success: (response) {
                                              if (response
                                                  is PersonalAssistantHomePageEntity) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 9.w),
                                                  child: Text(
                                                    response.data.name.isEmpty
                                                        ? 'Personal Assistant'
                                                        : response.data.name,
                                                    style: AppTextStyle
                                                        .whiteBold
                                                        .copyWith(
                                                            fontSize: 24.sp),
                                                  ),
                                                );
                                              } else {
                                                return Text('Unexpected Error');
                                              }
                                            }),
                                      );
                                    }),
                                    GestureDetector(
                                      onTap: () {
                                        _dialogBuilder(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: SizedBox(
                                          height: 27.w,
                                          width: 27.w,
                                          child: SvgPicture.asset(
                                              'assets/images/edit.svg'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                IgnorePointer(
                                  ignoring: true,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0.w),
                                    child: RatingBar(
                                      itemSize: 16.h,
                                      initialRating:
                                          response.data.rating_avrage ?? 0.0,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      maxRating: 5,
                                      itemPadding: EdgeInsets.only(right: 5.w),
                                      allowHalfRating: true,
                                      ratingWidget: RatingWidget(
                                        empty: SizedBox(
                                            height: 16.h,
                                            width: 13.w,
                                            child: SvgPicture.asset(
                                                AppImages.personalEmptyStar)),
                                        full: SizedBox(
                                            height: 16.h,
                                            width: 13.w,
                                            child: SvgPicture.asset(
                                                AppImages.personalFillStar)),
                                        half: SizedBox(
                                            height: 16.h,
                                            width: 13.w,
                                            child: SvgPicture.asset(
                                                AppImages.personalEmptyStar)),
                                      ),
                                      onRatingUpdate: (value) {
                                        print(value);
                                      },
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              color: const Color(0xff181928),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  children: [
                    // notification and calendar section
                    const NotificationSchedule(),
                    const AboutMeSection(),
                    BlocProvider(
                      create: (context) => getIt<GetReviewsCubit>()
                        ..getReviews(assistantId: userId!),
                      child: const ReviewsSection(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          return AlertDialog(
            title: const Text('Change your Name'),
            content: TextFormField(
              controller: dialogFieldController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.h),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.h,
                    ),
                  ),
                  hintText: 'New name'),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Confirm'),
                onPressed: () async {

                  ref.watch(signUpUserNameProvider.notifier).state =
                      dialogFieldController.text;
                  dialogFieldController.clear();
                  print(ref.watch(signUpUserNameProvider));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
