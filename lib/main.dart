import 'package:flutter/material.dart';
import 'package:vezeeto/core/routing/app_router.dart';
import 'package:vezeeto/vezeetoo.dart';

import 'core/di/depenedency_injection.dart';

void main() {
  setUpGetIt();
  runApp( VezeetooApp(
    appRouter: AppRouter(),
  ));
}
