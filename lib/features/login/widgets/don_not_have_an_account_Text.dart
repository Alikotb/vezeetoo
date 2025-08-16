import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:vezeeto/core/routing/routes.dart';
import 'package:vezeeto/core/theme/Style.dart';
import 'package:vezeeto/core/utils/extentions/extentions.dart';

class DonNotHaveAnAccountText extends StatelessWidget {
  const DonNotHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "don't have an account? ",
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
              text: "Sign up", style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUp);
              },
          ),
        ],
      ),
    );
  }
}
