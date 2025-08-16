import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vezeeto/core/routing/routes.dart';
import 'package:vezeeto/core/utils/extentions/extentions.dart';

import '../../../core/theme/Style.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => const Center(child: CircularProgressIndicator()),
            );
          },
          success: (data) {
            context.pop();
            context.pushReplacementNamed(Routes.home, arguments: data);
          },
          error: (text) {
            context.pop();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => AlertDialog(
                    icon: Icon(Icons.error, color: Colors.red, size: 32),
                    content: Text(text, style: TextStyles.font14DarkBlueMedium),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text(
                          "OK",
                          style: TextStyles.font14DarkBlueMedium,
                        ),
                      ),
                    ],
                  ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
