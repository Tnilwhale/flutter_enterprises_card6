import 'package:flutter/material.dart';
import 'package:skx1/services/news.dart';
import 'news_detail_page.dart';
import '../model/News.dart';


class NewsPage extends StatefulWidget{
  @override
  NewsPageState createState()=> NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModal listData =NewsListModal([]);
  int page=0;
  //获取新闻列表数据，同时回调使用
  void getNewsList() async{
    var data =await getNewsResult();
    NewsListModal list =NewsListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }
  @override
  void initState(){
    getNewsList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //pageView可加载广告之类
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
          //分割线构建器
          separatorBuilder: (BuildContext contex,int index)=>Divider(height: 1.0,color: Colors.grey,),
          itemCount: listData.data.length,
          //列表项构建器
          itemBuilder: (BuildContext contex,int index){
          //新闻列表项数据
          NewsItemModal item=listData.data[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            //跳转新闻详情界面
            onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context)=>NewsDetailPage(item: item)),
                );
            },
          );
          }),
    );
  }

}