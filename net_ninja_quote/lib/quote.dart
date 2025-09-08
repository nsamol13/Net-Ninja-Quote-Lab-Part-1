class Quote {

  String text;
  String author;
  String category;
  DateTime createdAt;
  int likes;

  Quote({
    required this.text,
    required this.author,
    this.category = 'General',
    DateTime? createdAt,
    this.likes = 0,
  })  : createdAt = createdAt ?? DateTime.now();
}

Quote myquote = Quote(text: 'this is the quote text', author: 'oscar wilde');