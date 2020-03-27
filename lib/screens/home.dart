import 'package:corona_tracker/widgets/indonesia_widget.dart';
import 'package:corona_tracker/widgets/world_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corona_tracker/providers/corona_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Lawan Covid19'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<CoronaProvider>(context, listen: false).getData(),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: Provider.of<CoronaProvider>(context, listen: false).getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Consumer<CoronaProvider>(
                  builder: (context, data, _) {
                    return Column(
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: IndonesiaWidget(
                              height: height,
                              data: data,
                            )),
                        Flexible(
                            flex: 1,
                            child: WorldWidget(
                              height: height,
                              data: data,
                            ))
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
