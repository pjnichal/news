import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';

class NewsProvider {
  late GraphQLClient _client;
  NewsProvider() {
    final HttpLink httpLink = HttpLink(
        'https://finer-boar-58.hasura.app/v1/graphql',
        defaultHeaders: {
          "x-hasura-admin-secret":
              "pOWpzehxYU5jXs14BB3BDPePovmDNgJUz04pu392MgX2G7CTbOYbsZ36qVACj4xs"
        });
    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
      defaultPolicies: DefaultPolicies(
        mutate: Policies(fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.networkOnly),
        subscribe: Policies(fetch: FetchPolicy.networkOnly),
        watchMutation: Policies(fetch: FetchPolicy.networkOnly),
        watchQuery: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }

  Future<QueryResult> fetchNews() async {
    var queryResult =
        await _client.query(QueryOptions(document: gql("""query MyQuery {
  news {
    auther
    content
    desription
    h_id
    publishedAt
    source
    title
    url
    urlToImage
  }
}
""")));

    return queryResult;
  }
}
