import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/network/api_keys.dart';
import 'package:news_app/core/network/api_service.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiServise _api;

  SearchRepoImpl(this._api);

  @override
  Future<Either<Failure, NewsResponse>> searchNews({required String q}) async {
    try {
      var response = await _api.get(
        endpoint: ApiKeys.everything,
        queryParameters: {
          "q": q,
          "sortBy": "publishedAt",
          "pageSize": 20,
          "searchIn": "title,description",
        },
      );
      final searchResponse = NewsResponse.fromJson(response);
      return Right(searchResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
