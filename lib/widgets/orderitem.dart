import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../models/orders.dart' as ord;


class OrderItem extends StatefulWidget {
  // const OrderItem({ Key? key }) : super(key: key);
  final ord.Orders order;
  dynamic index;

  OrderItem(this.order, this.index);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Text("${widget.order.products[0].title}"),
            title: Text("\$${widget.order.amount}"),
            subtitle:
                Text(DateFormat('dd/MM/yyyy').format(widget.order.dateTime)),
           
          
          ),
          
           
        ],
      ),
    );
  }
}
