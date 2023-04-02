import 'package:flutter/material.dart';

class QuotesItem extends StatelessWidget {
  const QuotesItem(
      {super.key,
      required this.auther,
      required this.quote,
      required this.delet,
      required this.index});
  final String auther;
  final String quote;
  final Function delet;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 57, 66, 151),
      margin: const EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(quote,
                style: const TextStyle(fontSize: 33, color: Colors.white),
                textDirection: TextDirection.rtl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delet(index);
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 27,
                  color: const Color.fromARGB(255, 255, 217, 217),
                ),
                Text(auther,
                    style: const TextStyle(fontSize: 19, color: Colors.white),
                    textDirection: TextDirection.rtl),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
