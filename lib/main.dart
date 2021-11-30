import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/main_layout.dart';
import 'package:todoapp/screens/menu_screen.dart';
import 'package:todoapp/services/tache_service.dart';
import 'package:todoapp/views/tache_list.dart';
import 'package:get_it/get_it.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => TacheService());
}

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TacheList(),
    );
  }
}
