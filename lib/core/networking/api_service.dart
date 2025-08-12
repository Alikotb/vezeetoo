
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vezeeto/features/login/data/model/login_response.dart';

import '../../features/login/data/model/login_request_body.dart';
import 'Api_Constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService<T> {
  factory ApiService(Dio dio, {String baseUrl})=_ApiService;

  @POST(ApiConstant.loginEndpoint)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

}