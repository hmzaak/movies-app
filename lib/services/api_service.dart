import 'package:dio/dio.dart';
import 'package:movies/app/app.logger.dart';

class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final logger = getLogger("ApiService");

  Future<Dio> launchDio({bool? isMultiform = false}) async {
    String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOTNkNzllNzJmOWU0OWU3ZWNkMGVkYmE3NGFkNjRmMCIsIm5iZiI6MTczMDUzMjQxNi43NzE2MjQsInN1YiI6IjY3MjVjZjY5NTcwNTc3ZGI2OGVkNGM0NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BYpXmlPeTDlHkFpkXqwSBScwp54d3jolRZyTddQ3DvI';
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['Content-Type'] =
        isMultiform == true ? 'multipart/form-data' : 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      if (status != null) {
        return status < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  Future<Response<dynamic>?> get(
      {required String endPoint, Map<String, dynamic>? params}) async {
    params = _addApiKeyToParams(params);
    try {
      Dio dio = await launchDio();
      final response =
          await dio.get('$_baseUrl/$endPoint', queryParameters: params);
      return response;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  _addApiKeyToParams(Map<String, dynamic>? params) {
    if (params != null) {
      params['api_key'] = "e93d79e72f9e49e7ecd0edba74ad64f0";
    }
    return params;
  }
}
