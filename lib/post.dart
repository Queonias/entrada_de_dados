class Post {
  int userId;
  int? id;
  String? title;
  String? body;
  int get getUserId => userId;

  Post(this.userId, this.id, this.title, this.body);

  Map toJson() {
    return {"userId": userId, "id": id, "title": title, "body": body};
  }

  set setUserId(int userId) => this.userId = userId;

  get getId => id;

  set setId(id) => this.id = id;

  get getTitle => title;

  set setTitle(title) => this.title = title;

  get getBody => body;

  set setBody(body) => body = body;

  static fromJson(post) {}
}
