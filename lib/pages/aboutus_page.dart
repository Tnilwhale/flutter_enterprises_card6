import 'package:flutter/material.dart';
import 'dart:async';
class AboutusPage extends StatefulWidget{
  @override
  AboutusPageState createState()=> AboutusPageState();
}

class AboutusPageState extends State<AboutusPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      print('flutter启动..');
      Navigator.of(context).pushReplacementNamed('company_info');
    });
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //pageView可加载广告之类
    return Text('4') ;
  }

}