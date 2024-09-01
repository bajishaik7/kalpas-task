import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_kalpas/api%20provider/api_provider.dart';
import 'package:task_kalpas/bloc/news_bloc/news_state.dart';
import 'package:task_kalpas/model/news_model.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsStateInitial());

  getNewsData() async {
    emit(NewsStateLoading());
    NewsModel newsModel = await ApiProvider().getNewsData();
    print("status==============${newsModel.status}");
    if (newsModel.status == "ok") {
      emit(NewsStateSuccess(articalList: newsModel.articles!));
    } else {
      emit(NewsStateFailed());
    }
  }
  
}
