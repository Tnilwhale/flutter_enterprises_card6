import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState()=>_LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      print('flutter启动..');
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //pageView可加载广告之类
//    ScreenUtil.instance = ScreenUtil(width:1080,height:2160)..init(context);
    return Center(
      child:Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
                'assets/images/loading.jpeg',
            ),
          ],
        ),
      )
    );
  }

}