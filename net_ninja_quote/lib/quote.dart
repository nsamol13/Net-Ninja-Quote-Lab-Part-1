class Quote {

  String text;
  String author;

  String category;
  int likes;

  Quote({
    required this.text,
    required this.author,
    this.category = 'General',
    this.likes = 0,
  });
}

Quote myquote = Quote(text: 'this is the quote text', author: 'oscar wilde');