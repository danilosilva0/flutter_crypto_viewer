import 'package:flutter/material.dart';
import 'package:flutter_crypto_viewer/models/coin.dart';
import 'package:flutter_crypto_viewer/repositories/coin_repository.dart';
import 'package:intl/intl.dart';

class CoinsPage extends StatefulWidget {
    const CoinsPage({super.key});

    @override
    State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
    final table = CoinRepository.table;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    List<Coin> selectedList = [];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Cryptocurrencies'),
                backgroundColor: Colors.indigoAccent
            ),
            body: ListView.separated(
                itemBuilder: (BuildContext context, int coinIndex) {
                    return ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        leading: (selectedList.contains(table[coinIndex])) ? CircleAvatar(child: Icon(Icons.check))
                            : SizedBox(width: 40, child: Image.asset(table[coinIndex].icon)),
                        title: Text(
                            table[coinIndex].name,
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)
                        ),
                        trailing: Text(real.format(table[coinIndex].price)),
                        selected: selectedList.contains(table[coinIndex]),
                        selectedTileColor: Colors.indigo[50],
                        //when a coin is pressed for a while
                        onLongPress: () {
                            setState(() {
                                    //if the pressed coin was already selected, it gets unselected, if not, it is added in the selected list
                                    (selectedList.contains(table[coinIndex])
                                        ? selectedList.remove(table[coinIndex])
                                        : selectedList.add(table[coinIndex]));
                                });
                        }
                    );
                },
                padding: EdgeInsets.all(16),
                separatorBuilder: (_, __) => Divider(),
                itemCount: table.length));
    }
}
