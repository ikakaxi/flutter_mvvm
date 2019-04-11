import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/network.dart';

///没有使用MVVM设计模式的Widget
///author:liuhc
class HomePageNoMVVM extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageNoMVVM> {
  bool _loading = true;
  String _text;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    NetWork.query().then((String text) {
      setState(() {
        _loading = false;
        _text = text;
      });
    }).catchError((error) {
      setState(() {
        _loading = false;
        _text = error.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter没有使用MVVM的示例"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("点击重新获取网络数据"),
              onPressed: () {
                loadData();
              },
            ),
            Offstage(
              offstage: !_loading,
              child: CircularProgressIndicator(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text("${_text ?? ""}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
