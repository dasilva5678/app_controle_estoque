import 'package:mobx/mobx.dart';
part 'stock_controller.g.dart';

class StockController = StockBase with _$StockController;

abstract class StockBase with Store {}
