import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:vezeeto/features/sign_up/logic/sign_up_state.dart';

import '../data/model/sign_up_request_body.dart';
import '../data/repo/sign_up_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signUp() async {
    emit(const SignUpState.loading());

    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (data) {
        emit(SignUpState.success(data));
      },
      failure: (error) {
        emit(SignUpState.error(message: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
