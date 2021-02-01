import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget{

  final String username;
  UsersPage({Key key,this.username}):super(key: key);
  @override
  Widget build(BuildContext context) {
//    Map args =ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('我的名片'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading:
                    CircleAvatar(backgroundImage: AssetImage('assets/images/drawer_head_sculpture.jpg')),
                    title: Text(
                      username,
                      style: TextStyle(fontSize: 28),
                    ),
                    subtitle: Text('职位：软件开发工程师'),
                  ),
                  ListTile(
                      subtitle: Text('方向：Web开发、移动终端开发')
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}