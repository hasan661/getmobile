import 'package:flutter/cupertino.dart';
import 'package:getmobile/models/cart.dart';

class Orders{
  final String id;
  final int amount;
  final List products;
  final DateTime dateTime;

  Orders({ required this.id,
      required this.amount,
      required this.dateTime,
      required this.products});

}
class OrderProvider with ChangeNotifier{
  List<Orders> _orders=[];

  List get orders{
    return [..._orders];
  }

  void addOrder(List cartProducts, int total)
  {
    _orders.insert(0, Orders(id: DateTime.now().toString(), amount: total, dateTime: DateTime.now(), products: cartProducts));
    notifyListeners();
  }
}