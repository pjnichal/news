part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  final QueryResult queryResult;

  NewsLoaded(this.queryResult) : super();

  @override
  List<Object> get props => [queryResult];
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}
