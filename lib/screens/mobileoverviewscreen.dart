import 'package:flutter/material.dart';
import 'package:getmobile/models/cart.dart';
import 'package:getmobile/models/mobile.dart';
import 'package:getmobile/screens/cartscreen.dart';
import 'package:getmobile/widgets/appdrawer.dart';
import 'package:getmobile/widgets/badge.dart';

import 'package:provider/provider.dart';

import '../widgets/mobileitem.dart';
import '../models/mobile_detail.dart';

enum FilterOptions {
  Favorites,
  All,
}

class MobileOverviewScreen extends StatefulWidget {
  // const MobileOverviewScreen({Key? key}) : super(key: key);
  @override
  _MobileOverviewScreenState createState() => _MobileOverviewScreenState();
}

class _MobileOverviewScreenState extends State<MobileOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final mobileData = Provider.of<MobileDetail>(context);
    final mobileitem = _showOnlyFavorites? mobileData.onlyFavorite :mobileData.mobiledetails;
    // final cartData=Provider.of<Cart>(context);
    // final mobile=Provider.of<Mobile>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions value) {
                setState(() {
                  if(value==FilterOptions.All)
                  {
                  _showOnlyFavorites=false;
                  }
                  else{
                    _showOnlyFavorites=true;
                  }
                });

                
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favorites"),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("All Item"),
                      value: FilterOptions.All,
                    )
                  ]),
          Consumer<CartItem>(
            builder: (_, cartData, ch){
              
              return Badge(child: ch!, value: cartData.itemcounts.toString(), color: Colors.black87);
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
        title: Container(
          width: double.infinity,
          child: Text(
            "Get-Mobile",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: mobileitem.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider<Mobile>.value(
          value: mobileitem[index],
          child: MobileItem(),
        ),
      ),
    );
  }
}
