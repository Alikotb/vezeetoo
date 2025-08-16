import 'package:flutter/cupertino.dart';

import '../theme/Style.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                text: "By logging, you agree to our ",
                style: TextStyles.font13grayRegular,
              ),
              TextSpan(
                text: "Terms & Conditions ",
                style:TextStyles.font13DarkBlueMedium,
              ),
              TextSpan(
                text: " and",
                style: TextStyles.font13grayRegular.copyWith(height: 1.5),
              ),
              TextSpan(
                text: " Privacy Policy.",
                style:TextStyles.font13DarkBlueMedium,
              ),
            ]
        )
    );
  }
}