import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezeeto/core/routing/app_router.dart';
import 'package:vezeeto/vezeetoo.dart';

import 'core/di/depenedency_injection.dart';

void main() async{
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(VezeetooApp(appRouter: AppRouter()));
}
