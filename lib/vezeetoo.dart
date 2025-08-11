
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/core/routing/app_router.dart';
import 'package:vezeeto/core/theme/AppColors.dart';

import 'core/routing/routes.dart';

class VezeetooApp extends StatelessWidget {
  final AppRouter appRouter;
  const VezeetooApp({super.key, required this.appRouter });

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vezeetoo',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,

        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
      ),

    );
  }
}
