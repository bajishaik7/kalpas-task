import 'package:task_kalpas/database/database.dart';
import 'package:task_kalpas/database/favnews_model.dart';

class DbHelper {
  insertFavNews(FavNewsModel favNewsModel) async {
    print("db insert=================2");
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    await database.favNewsDao.insertFavNews(favNewsModel);
  }

  Future<List<FavNewsModel>> getFavNews() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    List<FavNewsModel> list = await database.favNewsDao.getFavNews();

    return list;
  }

  deleteFavNewsById(int id) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    await database.favNewsDao.deleteFavNewsById(id);
  }
}
