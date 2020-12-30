import 'package:flutter/material.dart';
import 'package:skx1/pages/users_page.dart';
import 'pages/aboutus_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/product_page.dart';
import 'pages/news_page.dart';

//主组件实现模块切换
class App extends StatefulWidget{

  @override
  AppState createState()=> AppState();
}

class AppState extends State<App> {
  //当前选择页面索引
  var _currentIndex=0;
  HomePage homePage;
  ProductPage productPage;
  NewsPage newsPage;
  AboutusPage aboutusPage;
  //根据不同索引返回不同的页面
  currentPage(){
    switch(_currentIndex){
      case 0:
        if(homePage==null){
          homePage=HomePage();
        }
        return homePage;
      case 1:
        if(productPage==null){
          productPage=ProductPage();
        }
        return productPage;
      case 2:
        if(newsPage==null){
          newsPage=NewsPage();
        }
        return newsPage;
      case 3:
        if(aboutusPage==null){
          aboutusPage=AboutusPage();
        }
        return aboutusPage;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //pageView可加载广告之类
    return Scaffold(
      appBar: AppBar(
        title: Text('安徽坤恒信息科技'),
//        leading: Icon(Icons.account_circle),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap:(){
                //TODO:
              },
              child: Icon(Icons.search),
            ),
          )
        ],
      ),

      body: currentPage(),
      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        //通过fixedColor设置选中item的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index){
          setState(() {
            _currentIndex=index;
          });
        }),
        //底部导航栏
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
            title: Text('产品'),
            icon: Icon(Icons.apps),
          ),

          BottomNavigationBarItem(
            title: Text('新闻'),
            icon: Icon(Icons.fiber_new),
          ),

          BottomNavigationBarItem(
            title: Text('关于我们'),
            icon: Icon(Icons.insert_comment),
          ),

        ]
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                        accountName:Text(
                          '邵小毛',
                          style: TextStyle(color: Colors.white),
                        ),
                        accountEmail: Text(
                          '1294234770@qq.com',
                          style: TextStyle(color: Colors.white),
                        ),
                        currentAccountPicture:CircleAvatar(
                          backgroundImage: AssetImage('assets/images/drawer_head_sculpture.jpg'),
                        ),
                        decoration: BoxDecoration(
                          //color: Colors.lightBlueAccent
                          image: DecorationImage(
                            image: AssetImage('assets/images/drawer_background.jpg'),
                            fit: BoxFit.cover,
                          )
                        ),
                    ),
                )
              ],
            ),
            ListTile(
              title: Text('我的名片'),
              leading: CircleAvatar(
                child: Icon(Icons.account_circle)
              ),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context)=>UsersPage(username:'邵小毛',),
                  )
                );
              },
            ),
              Divider(),
              ListTile(
                title: Text('账户管理'),
                leading: CircleAvatar(
                  child: Icon(Icons.people)
                ),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context)=>LoginPage(),
                      )
                  );
                },
            ),
            Divider(),
            ListTile(
              title: Text('设置中心'),
              leading: CircleAvatar(
                  child: Icon(Icons.settings)
              ),
            ),
            Divider(),
          ],
        )

      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    ) ;
  }

}