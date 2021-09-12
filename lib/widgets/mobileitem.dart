import 'package:flutter/material.dart';
import 'package:getmobile/models/cart.dart';
import 'package:provider/provider.dart';

import '../screens/mobiledetailscreen.dart';
import '../models/mobile.dart';
class MobileItem extends StatelessWidget { 
  // bool showonlyfavorite;
  // MobileItem(this.showonlyfavorite);

  @override
  Widget build(BuildContext context) {
    final cartData=Provider.of<CartItem>(context);
    final mobileData=Provider.of<Mobile>(context);
    print(mobileData);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(MobileDetailScreen.routeName,
              arguments: mobileData.id);
        },
        
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: GridTile(
            child: Card(
                child: Image.network(
              mobileData.imageURL,
              height: 300,
              width: 200,
            )),
            footer: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
              child: Container(
                width: 200,
                child: GridTileBar(
                  trailing: IconButton(
                      onPressed: () {
                        cartData.addtocart(mobileData.id, mobileData.title, mobileData.price);
                        
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                  leading: 
                     IconButton(
                        onPressed: () {
                          mobileData.togglefavorite();
                        },
                        icon: Icon((mobileData.isFavorite ? Icons.favorite : Icons.favorite_border_outlined))),
                  
                  backgroundColor: Colors.black87,
                  title: Column(
                    children: [
                      Text(
                        mobileData.title,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${mobileData.price} Rs",
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
