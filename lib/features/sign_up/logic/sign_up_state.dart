import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@Freezed()
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial<T>;
  const factory SignUpState.loading() = Loading<T>;
  const factory SignUpState.success(T data) = Success<T>;
  const factory SignUpState.error({required String message}) = Error;
}