import 'package:flutter/material.dart';
import 'package:staff_breeze/style/app_text_style.dart';

class HireNotifications extends StatelessWidget {
  const HireNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      color: Color(0xff181928),
      child: Center(
        child: Text(
          'No Notifications',
          style: AppTextStyle.whiteBold,

        ),
      ),
    );
  }
}
