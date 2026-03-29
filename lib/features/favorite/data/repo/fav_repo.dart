import 'package:news_app/features/favorite/data/model/local_fav_model.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

abstract class FavRepo {
  Future<void> addFav(Article article);
  Future<void> removeFav(String id);
  List<LocalFavModel> getFav();
  bool isSaved(String id);
}
