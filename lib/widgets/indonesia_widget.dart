import 'package:corona_tracker/providers/corona_provider.dart';
import 'package:corona_tracker/widgets/summary_card.dart';
import 'package:flutter/material.dart';

class IndonesiaWidget extends StatelessWidget {
  final double height;
  final CoronaProvider data;

  const IndonesiaWidget({Key key, this.height, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: const Text(
            'Laporan Jumlah Kasus di Indonesia',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Divider(),
        Expanded(
          flex: 2,
          child: GridView.count(
            childAspectRatio: height / 350,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              SummaryCard(
                total: data.summary.confirmed.toString(),
                label: 'Terkonfirmasi',
                color: Colors.yellowAccent,
                size: 35,
              ),
              SummaryCard(
                total: data.summary.activeCare.toString(),
                label: 'Dalam Perawatan',
                color: Colors.purple[100],
                size: 35,
              ),
              SummaryCard(
                total: data.summary.recovered.toString(),
                label: 'Sembuh',
                color: Colors.greenAccent[100],
                size: 35,
              ),
              SummaryCard(
                total: data.summary.death.toString(),
                label: 'Meninggal',
                color: Colors.red[300],
                size: 35,
              )
            ],
          ),
        )
      ],
    );
  }
}
