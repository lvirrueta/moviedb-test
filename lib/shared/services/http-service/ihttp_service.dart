
import 'package:dio/dio.dart';
import 'package:moviedb/shared/services/http-service/error_http_model.dart';
import 'package:moviedb/shared/services/http-service/http_method_enum.dart';

abstract class IHttpService {
  Future<void> http({
    required String url,
    required HttpMethodEnum method,
    Object? data,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(Response<dynamic> response) ? success,
    void Function(ErrorHttp error) ? failure,
  });
}
