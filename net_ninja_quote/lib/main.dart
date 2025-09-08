import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken', category: 'Inspiration'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius', category: 'Humor'),
    Quote(author: 'Oscar Wilde', text:'The truth is rarely pure and never simple', category: 'Philosophy')
  ];

  void _incrementLikes(Quote quote) {
    setState(() {
      quote.likes++;
    });
  }

  Future<void> _confirmAndDelete(Quote quote) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete quote?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    ) ??
        false;

    if (ok) {
      setState(() {
        quotes.remove(quote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () => _confirmAndDelete(quote),
          onLike: () => _incrementLikes(quote),
        )).toList(),
      )
    );
  }
}
