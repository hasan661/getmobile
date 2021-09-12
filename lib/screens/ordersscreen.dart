import 'package:flutter/material.dart';
import 'package:getmobile/models/orders.dart';
import 'package:getmobile/widgets/appdrawer.dart';
import 'package:getmobile/widgets/orderitem.dart';
import 'package:provider/provider.dart';
class OrderScreen extends StatelessWidget {
  static const routeName="/orders";

  @override
  Widget build(BuildContext context) {
    final orderData=Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
       body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, index) => OrderItem(orderData.orders[index],index),
      ),


      
    );
  }
}