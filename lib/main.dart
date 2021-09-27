import 'package:flutter/material.dart';
import 'package:getmobile/models/cart.dart';
import 'package:getmobile/models/orders.dart';
import 'package:getmobile/screens/addproductscreen.dart';
import 'package:getmobile/screens/cartscreen.dart';
import 'package:getmobile/screens/mobiledetailscreen.dart';
import 'package:getmobile/screens/ordersscreen.dart';
import 'package:getmobile/screens/userproductscreen.dart';
import 'package:provider/provider.dart';

import '/screens/mobileoverviewscreen.dart';
import 'models/mobile_detail.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> color =
{
50:Color.fromRGBO(0,0,128,1),
100:Color.fromRGBO(0,0,128,1),
200:Color.fromRGBO(0,0,128,1),
300:Color.fromRGBO(0,0,128,1),
400:Color.fromRGBO(0,0,128,1),
500:Color.fromRGBO(0,0,128,1),
600:Color.fromRGBO(0,0,128,1),
700:Color.fromRGBO(0,0,128,1),
800:Color.fromRGBO(0,0,128,1),
900:Color.fromRGBO(0,0,128,1),
};


class MyApp extends StatelessWidget {
  

final MaterialColor colorCustom = MaterialColor(0xFF1824e4, color);
  
  @override
  Widget build(BuildContext context) {  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx)=>MobileDetail(),
        ),
        ChangeNotifierProvider(create: (ctx)=>CartItem(),),
        ChangeNotifierProvider(create: (ctx)=>OrderProvider(),)
        
      ],
      
    
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: colorCustom,
            canvasColor: Colors.white,
            accentColor: Color.fromRGBO(0, 0, 128, 1)
          ),
          routes:{
            "/":(ctx)=>MobileOverviewScreen(),
            MobileDetailScreen.routeName:(ctx)=>MobileDetailScreen(),
            CartScreen.routeName:(ctx)=>CartScreen(),
            OrderScreen.routeName:(ctx)=>OrderScreen(),
            UserProductScreen.routeName:(ctx)=>UserProductScreen(),
            AddProduct.routeName:(ctx)=>AddProduct()
            
      
          }
          
        ),
    );
      
  }
}




