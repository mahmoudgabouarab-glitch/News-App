import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/home/data/model/weather_response.dart';

abstract class HomeRepo {
  Future<Either<Failure, NewsResponse>> getLastestNews();
  Future<Either<Failure, NewsResponse>> getCategoryNews({
    required String category,
  });
  Future<Either<Failure, WeatherResponse>> getWeather({
    required double lat,
    required double long,
  });
}
