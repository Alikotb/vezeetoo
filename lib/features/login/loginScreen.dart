
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/core/theme/Style.dart';
import 'package:vezeeto/core/widgets/app_text_form_filed.dart';
import 'package:vezeeto/features/login/widgets/Already_Have_An_Account_Text.dart';
import 'package:vezeeto/features/login/widgets/Terms_And_Conditions_Text.dart';

import '../../core/theme/AppColors.dart';
import '../../core/widgets/App_Text_Btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                SizedBox(height: 8.h),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(height: 36.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: "email"),
                      SizedBox(height: 18.h),
                      AppTextFormField(
                        hintText: "password",
                        obscureText: isPasswordVisible,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorsManager.mainBlue,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.font13BlueRegular,
                        )
                      ),
                      SizedBox(height: 40.h),
                      AppTextBtn(
                        onPressed: (){},
                        btnText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                      ),
                      SizedBox(height: 16.h),
                      const TermsAndConditionsText(),
                      SizedBox(height: 60.h),
                      const AlreadyHaveAnAccountText(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
