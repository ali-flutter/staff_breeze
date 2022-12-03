import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/common_widgets/app_drawer.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/reviews_item.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';

import '../../../../style/app_images.dart';
import '../../../../style/app_text_style.dart';
import '../widgets/reviews_item.dart';

class PersonalAssistantHomePage extends StatefulWidget {
  PersonalAssistantHomePage({Key? key}) : super(key: key);

  @override
  State<PersonalAssistantHomePage> createState() =>
      _PersonalAssistantHomePageState();
}

class _PersonalAssistantHomePageState extends State<PersonalAssistantHomePage>
    with TickerProviderStateMixin {
  List<String> ratingStars = [
    AppImages.star,
    AppImages.star,
    AppImages.star,
    AppImages.star,
    AppImages.star,
  ];
  bool aboutMePenIsTapped = false;
  bool reviewsPenIsTapped = false;
  List<bool> tappedReviews = [false, false, false, false, false];
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  late AnimationController _controller;
  late AnimationController _animationController;

  bool isAboutMeSectionExpanded = false;
  bool isReviewSectionExpanded = false;
  List trailings = [
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
    Icons.keyboard_arrow_down_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        upperBound: 0.5);
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        upperBound: 0.5);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _key,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            //TODO HERE IM GOING TO SHOW THE PERSONAL ASSISTANT (IMAGE)
            Stack(
              children: [
                Container(
                  height: 314.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.personal_photo,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 52.w),
                    child: Column(
                      children: [
                        const Spacer(),
                        ListTile(
                          title: Text(
                            'Personal Assistant',
                            style: AppTextStyle.whiteBold
                                .copyWith(fontSize: 24.sp),
                          ),
                          trailing: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: const BoxDecoration(
                              color: Color(0xff343D58),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(AppImages.pen),
                            ),
                          ),
                          isThreeLine: false,
                        ),
                        SizedBox(
                          height: 26.h,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Row(
                              children: ratingStars
                                  .map(
                                    (star) =>
                                    SizedBox(
                                      width: 24.w,
                                      height: 20.h,
                                      child: SvgPicture.asset(
                                        star,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: IconButton(
                            icon: SvgPicture.asset(AppImages.edit_profile_icon),
                            onPressed: () {
                              _key.currentState!.openDrawer();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Flexible(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1,
                color: const Color(0xff181928),
                child: ListView(
                  children: [
                    // notification and calendar section
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.17,
                      decoration: BoxDecoration(

                       // borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20)),
                        border: Border(
                        //  width: 2,
                       //  color: Colors.amber
                          bottom: BorderSide(
                            style: BorderStyle.solid,
                           color: const Color(0xff423050),
                            width: 2.h,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 75.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, SCHEDULE);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 31.h,
                                    width: 31.w,
                                    child: SvgPicture.asset(
                                      AppImages.calendar,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Schedule',
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: const Color(0xff998FA2),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 56.w,
                            ),
                            Container(
                              height: 69.h,
                              width: 0.5.w,
                              color: const Color(0xff817889),
                            ),
                            SizedBox(
                              width: 56.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, NOTIFICATIONS);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 31.h,
                                    width: 31.w,
                                    child: SvgPicture.asset(
                                      AppImages.personalBell,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Notification',
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: Color(0xff998FA2),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // about me section
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: isAboutMeSectionExpanded == false
                          ? MediaQuery
                          .of(context)
                          .size
                          .height * 0.17
                          : 300.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: const Color(0xff423050),
                            width: 2.h,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 39.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 46.5.w,
                                ),
                                Text(
                                  'About Me',
                                  style: AppTextStyle.whiteBold.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 150.w,
                                ),
                                RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(_controller),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isAboutMeSectionExpanded) {
                                          _controller.reverse(from: 0.5);
                                        } else {
                                          _controller.forward(from: 0.0);
                                        }
                                        isAboutMeSectionExpanded =
                                        !isAboutMeSectionExpanded;
                                        aboutMePenIsTapped=false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      aboutMePenIsTapped = !aboutMePenIsTapped;
                                      if (isAboutMeSectionExpanded) {
                                        _controller.reverse(from: 0.5);
                                      } else {
                                        _controller.forward(from: 0.0);
                                      }
                                      isAboutMeSectionExpanded =
                                      !isAboutMeSectionExpanded;
                                    });
                                  },
                                  child: Container(
                                    height: 37.w,
                                    width: 37.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff343D58),
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                        AppImages.pen,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            isAboutMeSectionExpanded == true
                                ? Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: aboutMePenIsTapped ? 5.w : 45.w),
                                child: SizedBox(
                                  height: 220.h,
                                  child: !aboutMePenIsTapped ? ListView(
                                    physics:
                                    NeverScrollableScrollPhysics(),
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        'when I was 5 years old, my mother always told me',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                          color: const Color(0xff998FA2),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'that happiness was the key to life. When I went to',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                            color: const Color(
                                                0xff998FA2),
                                            fontSize: 12.sp,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                      Text(
                                        'school, they asked me what I wanted to be when I',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                            color: const Color(
                                                0xff998FA2),
                                            fontSize: 12.sp,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                      Text(
                                        'grew up. ',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                            color: const Color(
                                                0xff998FA2),
                                            fontSize: 12.sp,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'address : London ',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                            color: const Color(
                                                0xff998FA2),
                                            fontSize: 12.sp,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                      Text(
                                        'Language: English - Spanish',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                            color: const Color(
                                                0xff998FA2),
                                            fontSize: 12.sp,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                    ],
                                  ) : Center(
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [

                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 28.w),
                                          child: Card(
                                            shape: RoundedRectangleBorder(

                                              borderRadius: BorderRadius.circular(20),
                                              side: const BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            elevation: 0,
                                            child: Container(
                                              color: Color(0xff181928),
                                              height: 126.h,
                                              width: 287.w,
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25.w),
                                                  child: TextFormField(
                                                    style:TextStyle(
                                                      color: Color(0xff998FA2)
                                                    ),
                                                    decoration: const InputDecoration(

                                                      focusedBorder:

                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none),
                                                      border:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none),
                                                    ),
                                                    onChanged: (value) {

                                                    },


                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            AppButtons(buttonText: 'SAVE CHANGES',
                                                  buttonColor:const Color(0xff343D58),
                                                onPressed: (){},
                                                height:29.h,
                                                width:120.w,
                                              buttonTextStyle: AppTextStyle.whiteBold.copyWith(
                                                fontSize: 9.sp
                                              ),
                                            ), SizedBox(
                                              width: 30.w,
                                            )  ,
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                                : Container()
                          ],
                        ),
                      ),
                    ),

                    // Reviews Section
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: isReviewSectionExpanded == false
                          ? MediaQuery
                          .of(context)
                          .size
                          .height * 0.15
                          : 500.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: const Color(0xff423050),
                            width: 2.h,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 46.5.w,
                                ),
                                Text(
                                  'Reviews  ',
                                  style: AppTextStyle.whiteBold.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 150.w,
                                ),
                                RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(_animationController),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isReviewSectionExpanded) {
                                          _animationController.reverse(
                                              from: 0.5);
                                        } else {
                                          _animationController.forward(
                                              from: 0.0);
                                        }
                                        isReviewSectionExpanded =
                                        !isReviewSectionExpanded;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                             /*   Container(
                                  height: 37.h,
                                  width: 37.w,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff343D58),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      AppImages.pen,
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                            isReviewSectionExpanded
                                ? Expanded(
                              child: SizedBox(
                                height: 400.h,
                                width:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 1,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                  // physics: NeverScrollableScrollPhysics(),
                                    itemCount: 5,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w,
                                            vertical: 24.h),
                                        child: ReviewItem(
                                            expandingBoolean:
                                            tappedReviews[i],
                                            height:
                                            tappedReviews[i] == true
                                                ? 237.h
                                                : 150.h,
                                            image: getRandomPhoto(),
                                            reviewerName: getRandomName(),
                                            reviewsContent:
                                            "He's a very good assistant,"
                                                " He did his work perfectly, and Im happy to hire him again.",
                                            trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  //trailings[i]?  Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up;

                                                  if (trailings[i] ==
                                                      Icons
                                                          .keyboard_arrow_down_rounded) {
                                                    trailings[i] = Icons
                                                        .keyboard_arrow_up;
                                                    tappedReviews[i] =
                                                    true;
                                                  } else if (trailings[
                                                  i] ==
                                                      Icons
                                                          .keyboard_arrow_up) {
                                                    trailings[i] = Icons
                                                        .keyboard_arrow_down_rounded;
                                                    tappedReviews[i] =
                                                    false;
                                                  }
                                                });
                                              },
                                              icon: Icon(trailings[i]),
                                            )),
                                      );
                                    }),
                              ),
                            )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getRandomPhoto() {
    Random random = Random();
    List image = [
      AppImages.reviewer_one,
      AppImages.reviewer_two,
      AppImages.reviewer_three,
      AppImages.reviewer_four,
    ];
    return image[random.nextInt(image.length - 1)];
  }

  String getRandomName() {
    Random random = Random();
    List names = ['ali', 'mohammad', 'ahmad', 'modar'];
    return names[random.nextInt(names.length - 1)];
  }
}
