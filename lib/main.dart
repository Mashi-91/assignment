import 'dart:developer';

import 'package:assignment/data.dart';
import 'package:assignment/dataModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

Iterable<DbModel> getDataBasedLevel(String level) {
  return Data.db
      .map((e) => DbModel.fromJson(e))
      .toList()
      .where((e) => e.level == level);
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _listTile('Basic'),
            _listTile('Intermediate'),
            _listTile('Advanced'),
          ],
        ),
      ),
    );
  }

  Widget _listTile(String level) {
    final db = getDataBasedLevel(level).toList();
    return SizedBox(
      width: 200,
      child: ListView.builder(
        itemCount: db.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(db[i].level),
            subtitle: Text(db[i].name),
          );
        },
      ),
    );
  }
}
