import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class DioClient {
  late Dio _dio;
  DioClient() {
    _dio = Dio(BaseOptions(
        baseUrl: apiUrl,
        headers: {'Authorization': 'Bearer $token'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)));
  }

  Future<Response> get(String urlEndpoint) async {
    try {
      final response = await _dio.get(urlEndpoint);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

final dioProvider = Provider((ref) => DioClient());
