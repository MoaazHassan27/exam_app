import 'package:dio/dio.dart';
import 'package:exam_app/data/models/exams_response.dart';
import 'package:exam_app/data/models/forget_password_response.dart';
import 'package:exam_app/data/models/login_response.dart';
import 'package:exam_app/data/models/reset_password_response.dart';
import 'package:exam_app/data/models/subject_response.dart';
import 'package:exam_app/data/models/verify_email.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';
import 'package:exam_app/domain/model/verify_requset.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../domain/model/login_request.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/v1/auth/signin')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('/v1/auth/forgotPassword')
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest request);

  @POST('/v1/auth/verifyResetCode')
  Future<VerifyEmail> verificationCode(@Body() VerifyRequset request);

  @PUT('/v1/auth/resetPassword')
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest request);

  @GET('/v1/subjects')
  Future<SubjectResponse> getAllSubjects();

  @GET('/v1/exams')
  Future<ExamsResponse> getExam(@Query('subject') String id);
}
