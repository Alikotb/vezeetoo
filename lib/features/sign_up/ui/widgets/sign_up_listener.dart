import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vezeeto/core/utils/extentions/extentions.dart';

import '../../../../core/routing/routes.dart' show Routes;
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(child: CircularProgressIndicator()),
            );
          },
          success: (data) {
            context.pop();
            context.pushReplacementNamed(Routes.login);
          },
          error: (text) {
            context.pop();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                icon: Icon(Icons.error, color: Colors.red, size: 32),
                content: Text(text, style: TextStyle(fontSize: 14)),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text("OK", style: TextStyle(fontSize: 14)),
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
