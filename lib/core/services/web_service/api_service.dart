import 'package:dio/dio.dart';
import 'package:rickandmorty/core/services/web_service/api_constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options = options;
  }

  BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );

  Future<List<dynamic>> getData(String endpoint) async {
    try {
      final Response response = await dio.get(endpoint);

      return response.data['results'];
    } catch (e) {
      return [];
    }
  }
}
