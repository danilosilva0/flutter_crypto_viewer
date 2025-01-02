import 'package:flutter/material.dart';
import 'package:flutter_crypto_viewer/repositories/coin_repository.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final table = CoinRepository.table;

    return Scaffold(
        appBar: AppBar(
          title: Text('Cryptocurrencies'),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int coinIndex){
              return ListTile(
                leading: Image.asset(table[coinIndex].icon),
                title: Text(table[coinIndex].name),
                trailing: Text(table[coinIndex].price.toString()),
              );
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_,__) => Divider(),
            itemCount: table.length
        )
    );
  }
}
