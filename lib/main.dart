import 'package:flutter/material.dart';
import 'package:getmobile/models/cart.dart';
import 'package:getmobile/models/orders.dart';
import 'package:getmobile/screens/cartscreen.dart';
import 'package:getmobile/screens/mobiledetailscreen.dart';
import 'package:getmobile/screens/ordersscreen.dart';
import 'package:provider/provider.dart';

import '/screens/mobileoverviewscreen.dart';
import 'models/mobile_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
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
            primaryColor: Color.fromRGBO(0,0,128,1),
            canvasColor: Colors.white,
            accentColor: Color.fromRGBO(0, 0, 128, 1)
          ),
          routes:{
            "/":(ctx)=>MobileOverviewScreen(),
            MobileDetailScreen.routeName:(ctx)=>MobileDetailScreen(),
            CartScreen.routeName:(ctx)=>CartScreen(),
            OrderScreen.routeName:(ctx)=>OrderScreen()
      
          }
          
        ),
    );
      
  }
}




