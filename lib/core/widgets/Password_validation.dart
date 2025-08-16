import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/core/theme/Style.dart';

import '../theme/AppColors.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidation({super.key, required this.hasUpperCase, required this.hasLowerCase, required this.hasNumber, required this.hasSpecialCharacter, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("at least one uppercase letter", hasUpperCase),
        SizedBox(height: 2.h,),
        buildValidationRow("at least one lowercase letter", hasLowerCase),
        SizedBox(height: 2.h,),
        buildValidationRow("at least one number", hasNumber),
        SizedBox(height: 2.h,),
        buildValidationRow("at least one special character", hasSpecialCharacter),
        SizedBox(height: 2.h,),
        buildValidationRow("at least 8 characters", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidator) {
   return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor:ColorsManager.gray,
        ),
        SizedBox(width: 6.w,),
        Text(text,style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidator?TextDecoration.lineThrough:null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidator?ColorsManager.gray:ColorsManager.darkBlue,
        ),)
      ],
    );
  }
}
