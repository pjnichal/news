import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/widget/newscard.dart';
import 'package:news/provider/newsprovider.dart';

import '../logic/news_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List newsList = [];
    return Scaffold(
      appBar: AppBar(title: const Text("News"), centerTitle: true),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            newsList = state.queryResult.data?['news'];
            return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                      auther: newsList[index]['auther'],
                      imageURl: newsList[index]['urlToImage'],
                      title: newsList[index]['title'],
                      desription: newsList[index]['desription']);
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
