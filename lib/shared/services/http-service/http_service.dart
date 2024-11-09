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
    await dio.request(
      url,
      queryParameters: queryParameters,
      options: Options(
        method: method.name,
      ),
    );
  }

}
