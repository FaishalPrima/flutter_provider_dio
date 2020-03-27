import 'dart:convert';

import 'package:corona_tracker/api/api_provider.dart';
import 'package:corona_tracker/models/Indonesia_model.dart';
import 'package:corona_tracker/models/world_model.dart';
import 'package:flutter/cupertino.dart';

class CoronaProvider with ChangeNotifier {
  IndonesiaModel summary;
  WorldModel world;
  final _apiProvider = ApiProvider();

  Future<void> getData() async {
    summary = await _apiProvider.getDataIndonesia();
    world = await _apiProvider.getDataWorld();
    notifyListeners();
  }
}
