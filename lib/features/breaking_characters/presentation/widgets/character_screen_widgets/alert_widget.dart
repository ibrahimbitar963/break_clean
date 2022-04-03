import 'package:break_clean/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(


        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Check internet connection'.tr(),
                style: TextStyle(

                    fontSize: 18,
                  ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/notify.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
