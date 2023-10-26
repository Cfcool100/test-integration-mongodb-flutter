import 'package:flutter/material.dart';
import 'package:mongodb_test/config/mongodb.dart';
import 'package:mongodb_test/views/display_data.dart';
import 'package:mongodb_test/views/insert_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDataBase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InsertData(),
    );
  }
}
