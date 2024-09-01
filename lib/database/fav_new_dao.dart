// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:task_kalpas/database/favnews_model.dart';

@dao
abstract class FavNewsDao {
  
  @Query('SELECT * FROM FavNewsModel')
  Future<List<FavNewsModel>> getFavNews();


  @insert
  Future<void> insertFavNews(FavNewsModel favNewsModel);

   @Query('DELETE FROM FavNewsModel WHERE id = :id')
  Future<void> deleteFavNewsById(int id);
}