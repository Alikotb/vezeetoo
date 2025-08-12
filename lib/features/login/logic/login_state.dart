
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
@Freezed()
 class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial<T>;
  const factory LoginState.loading() = Loading<T>;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String message}) = Error;
}

