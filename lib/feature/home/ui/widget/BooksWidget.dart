import 'package:flutter/material.dart';

import '../../model/book.dart';
import '../book_cell.dart';

class BooksWidget extends StatelessWidget {
  final List<Book> items;
  final bool visible;

  BooksWidget({Key key, @required this.items, bool visible})
      : this.visible = visible ?? items.isNotEmpty,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: visible ? 1.0 : 0.0,
        child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: InkResponse(
                  enableFeedback: true,
                  child: BookCell(items, index),
                  //onTap: () => openDetailPage(snapshot.data, index),
                ),
              );
            }));
  }
}
