import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget{
//banner图片可入库放服务端，这里放客户端
  List<String> banners =<String>[
    'assets/images/banners/banner1.jpg',
    'assets/images/banners/banner2.jpg',
//    'assets/images/banners/banner3.jpg',
//    'assets/images/banners/banner4.jpg',
//    'assets/images/banners/banner5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //计算宽高，按比例排好
    double width =MediaQuery.of(context).size.width;
    double height=width*540.0/1080.0;
    return Container(
      width: width,
      height: height,
      //轮播组件
      child: Swiper(
        itemBuilder: (BuildContext context,index){
          return Container(
            //图片左右内边距
            margin: EdgeInsets.only(left: 5,right: 5),
            child: Image.asset(
              banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );

  }
}
