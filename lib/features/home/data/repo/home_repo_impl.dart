import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/network/api_keys.dart';
import 'package:news_app/core/network/api_service.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/home/data/model/weather_response.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService _api;

  HomeRepoImpl(this._api);
  @override
  Future<Either<Failure, NewsResponse>> getLastestNews() async {
    try {
      var response = await _api.get(
        endpoint: ApiKeys.headlines,
        queryParameters: {"category": "general"},
      );
      final newsResponse = NewsResponse.fromJson(response);
      return Right(newsResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NewsResponse>> getCategoryNews({
    required String category,
  }) async {
    try {
      var response = await _api.get(
        endpoint: ApiKeys.headlines,
        queryParameters: {"category": category},
      );
      final newsResponse = NewsResponse.fromJson(response);
      return Right(newsResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WeatherResponse>> getWeather({
    required double lat,
    required double long,
  }) async {
    try {
      var response = await _api.get(
        endpoint: ApiKeys.weather,
        queryParameters: {"lat": lat, "lon": long},
      );
      final weatherResponse = WeatherResponse.fromJson(response);
      return Right(weatherResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
