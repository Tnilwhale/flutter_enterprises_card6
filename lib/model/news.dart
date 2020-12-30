//新闻列表项数据转换
class NewsItemModal {
  String author;
  String title;
  String content;

  NewsItemModal({
    this.author,
    this.title,
    this.content,
  });

  factory NewsItemModal.fromJson(dynamic json){
    return NewsItemModal(
      author:json['author'],
      title:json['title'],
      content:json['content'],
//      imageUrl:json['imageUrl'],
    );
  }

}
//新闻列表数据转换
class NewsListModal{
  List<NewsItemModal> data;
  NewsListModal(this.data);

  factory NewsListModal.fromJson(List json){
    return NewsListModal(
        json.map((i) => NewsItemModal.fromJson((i))).toList()
    );
  }

}