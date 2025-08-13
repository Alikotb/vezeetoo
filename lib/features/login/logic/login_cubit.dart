import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vezeeto/features/login/data/model/login_request_body.dart';
import 'package:vezeeto/features/login/data/repo/login_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emmitDoLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(message: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
