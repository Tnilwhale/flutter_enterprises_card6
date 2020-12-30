import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skx1/pages/product_detail_page.dart';
import 'package:skx1/style/index.dart';
import '../model/product.dart';

class ProductResultListWidget extends StatelessWidget {
  //列表数据
  final ProductListModal list;
  //获取下一页数据
  final VoidCallback getNextPage;
  ProductResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //列表项数
            itemCount: list.data.length,
            //列表项构建
            itemBuilder: (BuildContext context, int i) {
              //列表项数据
              ProductItemModal item = list.data[i];
              //加载一页
              if ((i + 4) == list.data.length) {
                getNextPage();
              }
              return GestureDetector(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context)=>ProductDetailPage(item: item)
                      ),
                    );
                    },
                //列表项背景
                child: Container(
                  color: ProductColors.bgColor,
                  padding: EdgeInsets.only(top: 5.0, right: 5.0),
                  child: Row(
                    children: <Widget>[
                      //产品图片
                      Image.asset(
                        item.imageUrl,
                        width: 120.0,
                        height: 120.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: ProductColors.divideLineColor))),
                          //产品信息垂直布局
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  item.type,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: ProductColors.typeColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  //产品类型
                                  Text(
                                    item.desc,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  //
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
  }
}
