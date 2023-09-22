class Item {
  late int userId;
  late int id;
  late String title;
  late String body;

  Item(this.userId, this.id, this.title, this.body);

  static Item fromJson(Map<String, dynamic> jsonMap) {
    return Item(
        jsonMap["userId"], jsonMap["id"], jsonMap["title"], jsonMap["body"]);
  }

  @override
  String toString() {
    return "$userId - $id - $title - $body";
  }
}
