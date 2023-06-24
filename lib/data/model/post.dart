class Post {
  String title;
  String body;

  Post({
    required this.title,
    required this.body,
  });

  Post.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'];

  //toJson
  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };
}
