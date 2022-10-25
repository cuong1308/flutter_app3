class NewsModel {
  String? author;
  String? title;
  String? descripton;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  NewsModel({
    this.author, this.title, this.descripton, this.url, this.urlToImage,
    this.publishedAt, this.content
  });

  factory NewsModel.fromJson(Map<String, dynamic>obj) {
    return NewsModel(
        author: obj['author'],
        title: obj['title'],
        descripton: obj['description'],
        url: obj['url'],
        urlToImage: obj['urlToImage'],
        //publishedAt: obj['publishedAt'],
        content: obj['content']
    );
  }
}