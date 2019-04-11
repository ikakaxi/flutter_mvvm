import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/viewmodel_provider.dart';
import 'package:flutter_mvvm/page/home/viewmodel_home.dart';

///使用MVVM设计模式的Widget
///author:liuhc
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ViewModelProvider.of(context);
    _viewModel.init(context);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter使用MVVM的示例"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("点击重新获取网络数据"),
              onPressed: () {
                _viewModel.refreshData(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder(
                  stream: _viewModel.dataStream,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Text(
                      "${snapshot.hasError ? snapshot.error : snapshot.data}",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
