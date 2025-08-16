import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/AppColors.dart';
import '../../../../core/widgets/app_text_form_filed.dart';
import '../../../../core/widgets/Password_validation.dart';
import '../../logic/sign_up_cubit.dart';

class SigunUpForm extends StatefulWidget {
  const SigunUpForm({super.key});

  @override
  State<SigunUpForm> createState() => _SigunUpFormState();
}

class _SigunUpFormState extends State<SigunUpForm> {
  bool isPasswordVisible = true;
  late TextEditingController passwordController;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasLowerCase = password.contains(RegExp(r'[a-z]'));
        hasUpperCase = password.contains(RegExp(r'[A-Z]'));
        hasNumber = password.contains(RegExp(r'[0-9]'));
        hasSpecialCharacter = password.contains(
          RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
        );
        hasMinLength = password.length >= 8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty|| value.length < 3) {
                return "please enter valid Name";
              }
              return null;
            },
            controller: context.read<SignUpCubit>().nameController,
            hintText: "Name",
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty|| value.length < 11) {
                return "please enter valid Phone Number";
              }
              return null;
            },
            textType: TextInputType.number,
            controller: context.read<SignUpCubit>().phoneNumberController,
            hintText: "Phone Number",
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter valid email";
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return "please enter a valid email address";
              }
              return null;
            },
            controller: context.read<SignUpCubit>().emailController,
            hintText: "email",
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            hintText: "password",
            controller: context.read<SignUpCubit>().passwordController,

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
          SizedBox(height: 18.h),
          AppTextFormField(
            hintText: "Confirm Password",
            controller: context.read<SignUpCubit>().confirmPasswordController,

            obscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.mainBlue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty|| value != context.read<SignUpCubit>().passwordController.text) {
                return "didn't match password";
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
          ),
        ],
      ),
    );
  }
}
