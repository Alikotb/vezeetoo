
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/features/sign_up/logic/sign_up_cubit.dart';
import 'package:vezeeto/features/sign_up/ui/widgets/Already_Have_An_Account_Text.dart';
import 'package:vezeeto/features/sign_up/ui/widgets/sign_up_listener.dart';
import 'package:vezeeto/features/sign_up/ui/widgets/sigun_up_form.dart';

import '../../../core/theme/Style.dart';
import '../../../core/widgets/App_Text_Btn.dart';
import '../../../core/widgets/Terms_And_Conditions_Text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                Text("Create Account", style: TextStyles.font24BlueBold),
                SizedBox(height: 8.h),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(height: 36.h),
                Column(
                  children: [
                    const SigunUpForm(),
                    SizedBox(height: 40.h),
                    AppTextBtn(
                      onPressed: () {
                        validateThenSignUp(context);
                      },
                      btnText: "Sign Up",
                      textStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    SizedBox(height: 16.h),
                    const TermsAndConditionsText(),
                    SizedBox(height: 60.h),
                    const AlreadyHaveAnAccountText(),
                    const SignUpBlocListener(),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void validateThenSignUp(BuildContext context) {
    if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().signUp();
    }
  }
}
