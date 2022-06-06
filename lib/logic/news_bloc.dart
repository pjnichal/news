import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:news/provider/newsprovider.dart';
import 'package:news/repository/newsrepository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository = NewsRepository(NewsProvider());
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is FetchNews) {
        emit(NewsLoading());
        final result = await newsRepository.fetchNews();
        emit(NewsLoaded(result));
      }
    });
  }
}
