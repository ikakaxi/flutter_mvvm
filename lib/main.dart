import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/viewmodel_provider.dart';
import 'package:flutter_mvvm/page/home/page_home.dart';
import 'package:flutter_mvvm/page/home/page_home_no_mvvm.dart';
import 'package:flutter_mvvm/page/home/viewmodel_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageNoMVVM(),
//      home: ViewModelProvider(
//        viewModel: HomeViewModel(),
//        child: HomePage(),
//      ),
    );
  }
}
