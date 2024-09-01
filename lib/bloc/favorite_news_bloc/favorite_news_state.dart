import 'package:equatable/equatable.dart';
import 'package:task_kalpas/database/favnews_model.dart';

import '../../model/news_model.dart';

class favNewsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class favNewsStateInitial extends favNewsState {}

class favNewsStateLoading extends favNewsState {}

class favNewsStateSuccess extends favNewsState {
  final List<FavNewsModel> favNewsList;
  favNewsStateSuccess({required this.favNewsList});
}

class favNewsStateFailed extends favNewsState {}
