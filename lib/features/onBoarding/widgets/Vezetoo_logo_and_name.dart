import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vezeeto/core/theme/Style.dart';

import '../../../generated/assets.dart';

class VezetooLogoAndName extends StatelessWidget {
  const VezetooLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsLogo),
        SizedBox(width: 10.w),
        Text(
            "Vezeetoo",
          style: TextStyles.font24Black70weight,
        )
      ],
    );
  }
}
