import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

abstract class SearchRepo {
  Future<Either<Failure, NewsResponse>> searchNews({required String q});
}
