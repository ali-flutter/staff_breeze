import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

class JobHistoryPage extends StatelessWidget {
  const JobHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff707070),
          ),
          onPressed: () {},
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
              Flexible(
                  child:Container(
                    width: MediaQuery.of(context).size.width*1,
                    color:const Color(0xff181928),
                    child: Center(
                      child: Text('Your Job history is empty',
                        style:AppTextStyle.whiteBold ,
                      ),
                    ),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
