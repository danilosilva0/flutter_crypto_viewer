import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_viewer/models/coin.dart';

class FavoritesRepository extends ChangeNotifier{
  List<Coin> _list = [];

  UnmodifiableListView<Coin> get list => UnmodifiableListView(_list);

  saveAll(List<Coin> coins){
    for (var coin in coins) {
      if(!_list.contains(coin)) _list.add(coin);
    }
    notifyListeners();
  }

  remove(Coin coin){
    _list.remove(coin);
    notifyListeners();
  }
}