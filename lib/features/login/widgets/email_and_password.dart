import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/AppColors.dart';
import '../../../core/widgets/app_text_form_filed.dart';
import '../logic/login_cubit.dart';
import '../../../core/widgets/Password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isPasswordVisible = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }
  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasLowerCase = password.contains(RegExp(r'[a-z]'));
        hasUpperCase = password.contains(RegExp(r'[A-Z]'));
        hasNumber = password.contains(RegExp(r'[0-9]'));
        hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        hasMinLength = password.length >= 8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter valid email";
              }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
                return "please enter a valid email address";
              }
              return null;
            },
            controller: context.read<LoginCubit>().emailController,
            hintText: "email",
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            hintText: "password",
            controller: context.read<LoginCubit>().passwordController,

            obscureText: isPasswordVisible,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.mainBlue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter valid password";
              }
            },
          ),
          SizedBox(height: 24.h),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinLength: hasMinLength,
          )
        ],
      ),
    );
  }
  dispose() {
    passwordController.removeListener(setUpPasswordControllerListener);
    super.dispose();
  }

}
