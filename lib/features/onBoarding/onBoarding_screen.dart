import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/core/theme/Style.dart';
import 'package:vezeeto/features/onBoarding/widgets/Vezetoo_logo_and_name.dart';
import 'package:vezeeto/features/onBoarding/widgets/doctor_Img_and_text.dart';
import 'package:vezeeto/features/onBoarding/widgets/get_started_btn.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top:30.h, bottom: 30.h),
            child:  Column(children: [
              const VezetooLogoAndName(),
              SizedBox(height: 30.h),
              const DoctorImgAndText(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    style: TextStyles.font13grayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    const GetStartedBtn()
                  ],
                ),
              )

            ]),
          ),
        ),
      ),
    );
  }
}
