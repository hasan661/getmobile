import 'package:flutter/material.dart';
import 'package:getmobile/screens/mobiledetailscreen.dart';
import 'package:provider/provider.dart';

import '/screens/mobileoverviewscreen.dart';
import '/providers/mobile_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {  
    return ChangeNotifierProvider(
      create: (ctx)=>MobileDetail(),
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
    
        }
        
      ),
    );
  }
}




