import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:news/provider/newsprovider.dart';

class NewsRepository {
  final NewsProvider newsProvider;

  NewsRepository(this.newsProvider);
  Future<QueryResult> fetchNews() {
    return newsProvider.fetchNews();
  }
}
