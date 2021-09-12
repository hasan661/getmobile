import 'package:flutter/material.dart';
import 'package:getmobile/models/cart.dart';
import 'package:getmobile/models/orders.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/CartScreen";


  @override
  Widget build(BuildContext context) {
    final orderData=Provider.of<OrderProvider>(context);
    final cartData = Provider.of<CartItem>(context);
    final cartItem = Provider.of<CartItem>(context).items;
    print(cartItem);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price:"),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30,
                      child: Text("${cartData.totalamount()}"),
                    ),
                    TextButton(onPressed: (){

                      orderData.addOrder(cartData.items.values.toList(), cartData.totalamount());
                      cartData.clearCart();
                    }, child: Text("Place Order",style: TextStyle(color: Theme.of(context).primaryColor),), )
                  ],
                ),
                
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartItem.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Dismissible(
                      onDismissed: (_)
                      {
                        cartData.itemdelete("${cartItem.keys.toList()[index]}");

                      },
                      key: ValueKey(cartItem.values.toList()[index].id),
                      child: ListTile(
                        leading: Text(
                          "${cartItem.values.toList()[index].title} x ${cartItem.values.toList()[index].quantity}",
                          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight:  FontWeight.bold),
                        ),
                        trailing: Text("${cartItem.values.toList()[index].price * cartItem.values.toList()[index].quantity } Rs"),
                        
                      ),
                    ),
                  );
                }),
          ),
          
        ],
      ),
    );
  }
}
