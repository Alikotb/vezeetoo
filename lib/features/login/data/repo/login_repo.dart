import 'package:vezeeto/core/networking/Api_Error_Handeler.dart';
import 'package:vezeeto/core/networking/api_result.dart';
import 'package:vezeeto/core/networking/api_service.dart';
import '../model/login_request_body.dart';

import '../model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
