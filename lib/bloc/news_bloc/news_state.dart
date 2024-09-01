import 'package:equatable/equatable.dart';

import '../../model/news_model.dart';

class NewsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsStateInitial extends NewsState {}

class NewsStateLoading extends NewsState {}

class NewsStateSuccess extends NewsState {
  final List<Articles> articalList;
  NewsStateSuccess({required this.articalList});
}

class NewsStateFailed extends NewsState {}
