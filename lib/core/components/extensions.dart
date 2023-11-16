import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension Navigation on BuildContext {
  Future push(Widget screen) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));

  void pop() => Navigator.of(this).pop();

  Future pushAndRemoveUntil(Widget screen) => Navigator.pushAndRemoveUntil(
      this, MaterialPageRoute(builder: (_) => screen), (route) => false);

}
