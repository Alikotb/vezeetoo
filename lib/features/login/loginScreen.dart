import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/core/theme/Style.dart';
import 'package:vezeeto/features/login/widgets/Already_Have_An_Account_Text.dart';
import 'package:vezeeto/features/login/widgets/Terms_And_Conditions_Text.dart';
import 'package:vezeeto/features/login/widgets/email_and_password.dart';
import 'package:vezeeto/features/login/widgets/login_bloc_listener.dart';

import '../../core/widgets/App_Text_Btn.dart';
import 'data/model/login_request_body.dart';
import 'logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Column(
                  children: [
                    const EmailAndPassword(),
                    SizedBox(height: 21.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AppTextBtn(
                      onPressed: () {
                        validateThenLogin(context);
                      },
                      btnText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    SizedBox(height: 16.h),
                    const TermsAndConditionsText(),
                    SizedBox(height: 60.h),
                    const AlreadyHaveAnAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emmitDoLoginState(
        LoginRequestBody(
          email:  context.read<LoginCubit>().emailController.text,
          password:  context.read<LoginCubit>().passwordController.text,
        )
      );
    }
  }
}
