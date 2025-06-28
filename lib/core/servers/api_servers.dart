import 'package:coffee_app/core/servers/api_key.dart';
import 'package:coffee_app/core/servers/failers.dart';
import 'package:dio/dio.dart';

class ApiServers {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://stzizveykfwkkzscqxlk.supabase.co/rest/v1/",
      headers: {"apikey": apiKey},
    ),
  );
  Future<Response> getdata(String path) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      // حوّل الخطأ إلى ServerFailuer وارمه
      throw ServerFailuer.fromDioException(e);
    } catch (e) {
      // لو حصل أي خطأ غير متوقع
      throw ServerFailuer('Unexpected Error: ${e.toString()}');
    }
  }
}
