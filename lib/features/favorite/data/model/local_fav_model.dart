import 'package:hive/hive.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

part 'local_fav_model.g.dart';
@HiveType(typeId: 0)
class LocalFavModel extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String urlToImage;
  @HiveField(3)
  late String publishedAt;

  LocalFavModel({
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory LocalFavModel.fromArticle(Article article) {
    return LocalFavModel(
      title: article.title,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
    );
  }
}