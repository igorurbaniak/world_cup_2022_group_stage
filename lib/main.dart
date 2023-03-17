import 'package:flutter/material.dart';
import 'package:world_cup_2022_group_stage/app/injection_container.dart';
import 'package:world_cup_2022_group_stage/features/group/home_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'World Cup Group Stage',
      home: GroupPage(),
    );
  }
}
