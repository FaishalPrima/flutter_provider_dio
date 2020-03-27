import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String total;
  final String label;
  final Color color;
  final int size;

  const SummaryCard({Key key, this.total, this.label, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            total,
            style: TextStyle(
                fontSize: size.toDouble(), fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}
