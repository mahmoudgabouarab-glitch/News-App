import 'package:hive/hive.dart';
import 'package:news_app/features/favorite/data/model/local_fav_model.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class FavRepoImpl implements FavRepo {
  final Box<LocalFavModel> _box = Hive.box<LocalFavModel>('favorite');

  @override
  Future<void> addFav(Article article) async {
    await _box.put(article.url, LocalFavModel.fromArticle(article));
  }

  @override
  Future<void> removeFav(String id) async {
    await _box.delete(id);
  }

  @override
  List<LocalFavModel> getFav() {
    return _box.values.toList();
  }

  @override
  bool isSaved(String id) {
    return _box.containsKey(id);
  }
}