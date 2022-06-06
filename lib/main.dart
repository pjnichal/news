import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:news/logic/news_bloc.dart';
import 'package:news/presentation/homepage.dart';

Future<void> main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: child,
        );
      },
      child: BlocProvider(
        create: (context) => NewsBloc()..add(FetchNews()),
        child: const HomePage(),
      ),
    );
  }
}
