import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:vezeeto/core/routing/routes.dart';
import 'package:vezeeto/core/theme/Style.dart';
import 'package:vezeeto/core/utils/extentions/extentions.dart';

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
              text: "Login", style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.login);
              },
          ),
        ],
      ),
    );
  }
}
