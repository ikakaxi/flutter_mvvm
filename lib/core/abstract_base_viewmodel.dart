import 'package:flutter/widgets.dart';

///所有viewModel的父类，提供一些公共功能
///author:liuhc
abstract class BaseViewModel {

  bool _isFirst = true;

  bool get isFirst=>_isFirst;

  @mustCallSuper
  void init(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      doInit(context);
    }
  }

  ///获取数据
  @protected
  Future refreshData(BuildContext context);

  @protected
  void doInit(BuildContext context);

  void dispose();
}
