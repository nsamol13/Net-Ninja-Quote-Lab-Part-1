import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:intl/intl.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final VoidCallback onLike;
  final VoidCallback delete;

  const QuoteCard({
  super.key,
  required this.quote, required this.delete, required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, yyyy').format(quote.createdAt);

    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                quote.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                )
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Category: ${quote.category}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blueGrey[600],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  dateStr,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blueGrey[600],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: onLike,
                ),
                Text('${quote.likes}'),
              ],
            ),
            SizedBox(height: 8.0),
            TextButton.icon(
              onPressed: delete,
              label: Text('delete quote'),
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}