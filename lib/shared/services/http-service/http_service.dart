import 'package:dio/dio.dart';
import 'package:moviedb/shared/constants/environment_constants.dart';
import 'package:moviedb/shared/services/http-service/error_http_model.dart';
import 'package:moviedb/shared/services/http-service/http_method_enum.dart';
import 'package:moviedb/shared/services/http-service/ihttp_service.dart';

class HttpService implements IHttpService {

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      headers: {'Authorization': 'Bearer ${Environment.apiToken}'}
    ),
  );

  @override
  Future<void> http({
    required String url, 
    required HttpMethodEnum method,
    Map<String, dynamic>? queryParameters,
    Object? data,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(Response<dynamic> response) ? success,
    void Function(ErrorHttp error) ? failure,
  }) async {

    loading?.call();
    // await Future.delayed(const Duration(seconds: 3));
    try {  
      final resp = await dio.request(
        url,
        queryParameters: queryParameters,
        options: Options(
          method: method.name,
        ),
      );
      success?.call(resp);
    } on DioException catch (e) {
      _catchErrors(errorException: e, failure: failure);
    } finally {
      finishLoading?.call();
    }
  }

  void _catchErrors({
    required DioException errorException,
    void Function(ErrorHttp errorHttp) ? failure,
  }) {
    final dynamic data = errorException.response?.data;
    final error = ErrorHttp.fromJson(data);
    return failure?.call(error);
  }

}
