import 'package:flutter/material.dart';
import 'package:getmobile/models/mobile_detail.dart';
import 'package:getmobile/screens/addproductscreen.dart';
import 'package:getmobile/widgets/appdrawer.dart';
import 'package:getmobile/widgets/userproductitem.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);
  static const routeName = "/user-products";

  @override
  Widget build(BuildContext context) {
    final mobileData = Provider.of<MobileDetail>(context).mobiledetails;
    print(mobileData);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Product Screen"),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: mobileData
                  .map((e) => UserProductItem(
                      id: e.id, imageURL: e.imageURL, title: e.title))
                  .toList(),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProduct.routeName);
            },
            child: Text("Press To Add More"),
          )
        ],
      ),
    );
  }
}
