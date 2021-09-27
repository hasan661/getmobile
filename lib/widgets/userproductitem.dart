import 'package:flutter/material.dart';
import 'package:getmobile/models/mobile_detail.dart';
import 'package:getmobile/screens/addproductscreen.dart';
import 'package:provider/provider.dart';
class UserProductItem extends StatelessWidget {
  String title;
  String imageURL;
  String id;

  

  UserProductItem({required this.id, required this.imageURL, required this.title});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(imageURL),
        title: Text("$title"),
        trailing: Container(
          width: 100,
            child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
            IconButton(onPressed: (){
              Provider.of<MobileDetail>(context, listen: false).deletemobile(id);
            }, icon: Icon(Icons.delete), color: Theme.of(context).errorColor,),
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(AddProduct.routeName, arguments: id);
            }, icon: Icon(Icons.edit), color:  Theme.of(context).primaryColor,)
          ],),
        ),
      
      ),
    );
  }
}