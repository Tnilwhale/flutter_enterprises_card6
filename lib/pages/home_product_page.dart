import 'package:flutter/material.dart';
import 'package:skx1/utils/utils.dart';

import '../model/product.dart';
import 'product_detail_page.dart';

class HomeProductPage extends StatelessWidget {
  final ProductListModal list;
  HomeProductPage(this.list);


  @override
  Widget build(BuildContext context) {
    //设备宽度
    double deviceWidth=MediaQuery.of(context).size.width;
    //背景容器
    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10,bottom: 10,left: 7.5),
      child: _build(context,deviceWidth),
    );
  }
  //返回标题及列表
  Widget _build(BuildContext context,double deviceWidth){
    //Item宽度
    double itemWidth =deviceWidth * 168.5 / 360;
    double imageWidth=deviceWidth * 110.0 / 360;
    //返回产品列表
    List<Widget> listWidgets=list.data.map((i){
      var bgColor = ColorsUtil.hexColor(0xf8f8f8);
      Color titleColor=ColorsUtil.hexColor(0x87cefa);
      Color subtitleColor=ColorsUtil.hexColor(0x999999);

//      ColorsUtil.hexColor(0x3caafa)//透明度为1
//      ColorsUtil.hexColor(0x3caafa,alpha: 0.5)//透明度为0.5

      //返回产品项
      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder:(context)=>ProductDetailPage(item:i)),
          );
        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5,left: 2),
          padding: EdgeInsets.only(top: 10,left: 13,bottom: 7),

          color: bgColor,
          //Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15,color: titleColor),
              ),
              SizedBox(height: 4),
              Text(
                i.type,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13,color: subtitleColor),
              ),
              Container(
                alignment: Alignment(0, 0),
//              margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  i.imageUrl,
                  width: imageWidth,
                  height: imageWidth,
                ),
              )
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5,bottom: 10),
          child: Text('合作企业',style: TextStyle(
            fontSize: 16.0,
            color: Color.fromRGBO(50, 50, 50, 1),
          ),),
        ),
        //流式布局列表
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );

  }
}