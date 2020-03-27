import 'package:corona_tracker/providers/corona_provider.dart';
import 'package:corona_tracker/widgets/summary_card.dart';
import 'package:flutter/material.dart';

class WorldWidget extends StatelessWidget {
  final double height;
  final CoronaProvider data;

  const WorldWidget({Key key, this.height, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: const Text(
            'Laporan kasus dunia',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: height / 430,
              children: <Widget>[
                SummaryCard(
                  total: data.world.confirmed,
                  label: 'Positif',
                  color: Colors.yellowAccent[100],
                  size: 20,
                ),
                SummaryCard(
                  total: data.world.recovered,
                  label: 'Sembuh',
                  color: Colors.greenAccent[100],
                  size: 20,
                ),
                SummaryCard(
                  total: data.world.death,
                  label: 'Meninggal',
                  color: Colors.red[300],
                  size: 20,
                )
              ],
            )),
        Text('Pembaruan Terakhir'),
        Text(data.summary.updated)
      ],
    );
  }
}
