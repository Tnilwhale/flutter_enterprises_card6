import 'loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'app.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '安徽坤恒信息科技',
  theme: mDefaultTheme,
  //添加路由
    routes: <String,WidgetBuilder>{
    'app':(context)=>App(),
//    '/users_page':(context)=>UsersPage(),
    'company_info':(context)=>WebviewScaffold(
      url:'https://aiqicha.baidu.com/company_detail_33479983867161',
    appBar: AppBar(
      title: Text('公司介绍'),
      leading: IconButton(
        icon: Icon(Icons.home),
          onPressed: (){
          //路由到主界面
          Navigator.of(context).pushReplacementNamed('app');
          },
      ),
    ),
    ),
  },
    //指定加载页面
  home: LoadingPage(),

  //自定义主题
));

final ThemeData mDefaultTheme=ThemeData(
  primaryColor: Colors.lightBlueAccent

);