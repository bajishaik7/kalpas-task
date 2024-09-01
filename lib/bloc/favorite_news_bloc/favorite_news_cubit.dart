import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_kalpas/api%20provider/api_provider.dart';
import 'package:task_kalpas/bloc/news_bloc/news_state.dart';
import 'package:task_kalpas/database/db_helper.dart';
import 'package:task_kalpas/database/favnews_model.dart';
import 'package:task_kalpas/model/news_model.dart';

import 'favorite_news_state.dart';

class FavNewsCubit extends Cubit<favNewsState> {
  FavNewsCubit() : super(favNewsStateInitial());

  getFavNewsData() async {
    emit(favNewsStateLoading());
    List<FavNewsModel> favNewsList
     = await DbHelper().getFavNews();
   
    if (favNewsList.length!=0) {
      emit(favNewsStateSuccess(favNewsList: favNewsList));
    } else {
      print("failed====");
      emit(favNewsStateFailed());
    }
  }
  deleteFavNewsById(int id)async{
 await DbHelper().deleteFavNewsById(id);
 getFavNewsData();

}
  
}



