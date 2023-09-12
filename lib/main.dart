import 'package:flutter/material.dart';
import 'package:xpayback/core/core_ui.dart';
import 'package:xpayback/user_data_list_screen/user_data_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Data',
      theme: ThemeInfo.theme,
      home: const UserDataList(),
    );
  }
}
