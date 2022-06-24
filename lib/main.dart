import 'package:flutter/material.dart';
import 'package:flutter_application_cat_fact/models/fact.dart';
import 'package:flutter_application_cat_fact/screens/home/my_home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FactAdapter());
  await Hive.openBox<Fact>('fact');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Amazing Facts About Cats'),
    );
  }
}
