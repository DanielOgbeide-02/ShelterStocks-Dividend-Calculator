import 'package:dividend_calculator/dividend/dividend.dart';
import 'package:flutter/cupertino.dart';

class DividendData with ChangeNotifier{
  Dividend? _dividend;
  Dividend? get dividend => _dividend;

}