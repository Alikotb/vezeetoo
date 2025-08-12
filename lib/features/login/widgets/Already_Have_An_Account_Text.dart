import 'package:flutter/cupertino.dart';
import 'package:vezeeto/core/theme/Style.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
       textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ",
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: "Sign up",
            style:TextStyles.font13BlueSemiBold,
          ),
        ]
      )
    );
  }
}
