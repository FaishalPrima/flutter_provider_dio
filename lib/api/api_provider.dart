import 'dart:convert';

import 'package:corona_tracker/models/Indonesia_model.dart';
import 'package:corona_tracker/models/world_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final urlIndonesia = 'https://kawalcovid19.harippe.id/api/summary';
  final urlWorldPositive = 'https://api.kawalcorona.com/positif/';
  final urlWorldRecovered = 'https://api.kawalcorona.com/sembuh/';
  final urlWorldDeaths = 'https://api.kawalcorona.com/meninggal/';

  Dio _dio;

  ApiProvider() {
    final baseOptions = BaseOptions(
        connectTimeout: 50000, receiveTimeout: 50000, sendTimeout: 50000);
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<IndonesiaModel> getDataIndonesia() async {
    try {
      final response = await _dio.get(urlIndonesia);

      final result = response.data as Map<String, dynamic>;

      final indonesiaModel = IndonesiaModel(
          confirmed: result['confirmed']['value'],
          recovered: result['recovered']['value'],
          death: result['deaths']['value'],
          activeCare: result['activeCare']['value'],
          updated: result['metadata']['lastUpdatedAt']);

      return indonesiaModel;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<WorldModel> getDataWorld() async {
    try {
      final responsePositive = await _dio.get(urlWorldPositive);
      final resultPositive = responsePositive.data as Map<String, dynamic>;

      final responseRecovered = await _dio.get(urlWorldRecovered);
      final resultRecovered = responseRecovered.data as Map<String, dynamic>;

      final responseDeath = await _dio.get(urlWorldDeaths);
      final resultDeath = responseDeath.data as Map<String, dynamic>;

      final world = WorldModel(
          confirmed: resultPositive['value'],
          death: resultDeath['value'],
          recovered: resultRecovered['value']);

      return world;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
