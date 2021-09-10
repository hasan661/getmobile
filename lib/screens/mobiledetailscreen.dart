import 'package:flutter/material.dart';
import 'package:getmobile/providers/mobile_detail.dart';
import 'package:provider/provider.dart';

class MobileDetailScreen extends StatelessWidget {
  static const routeName = "/mobiledetail";
  const MobileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mobileData = Provider.of<MobileDetail>(context).mobiledetails;
    final id = ModalRoute.of(context)!.settings.arguments;
    final _loadedmobiles = mobileData.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${_loadedmobiles.title}",
        ),
      ),
      // body: Image.network(),
    );
  }
}
