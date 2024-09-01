import 'dart:async';

import 'package:floor/floor.dart';
import 'package:task_kalpas/database/fav_new_dao.dart';
import 'package:task_kalpas/database/favnews_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';


@Database(version: 1, entities: [FavNewsModel])
abstract class AppDatabase extends FloorDatabase {
  FavNewsDao get favNewsDao;
}
