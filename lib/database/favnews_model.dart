import 'package:floor/floor.dart';

@entity
class FavNewsModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? title;
  String? content;
  String? imageUrl;
  String? Date;

  FavNewsModel({this.id,this.Date, this.content, this.imageUrl, this.title});
}
