import "package:flutter/material.dart";
import "package:flutter_crypto_viewer/repositories/favorites_repository.dart";
import "package:flutter_crypto_viewer/widgets/coin_card.dart";
import "package:provider/provider.dart";

class FavoritesPage extends StatefulWidget {
    const FavoritesPage({super.key});

    @override
    State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

    int currentPage = 1;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Favorites'),
                centerTitle: true,
                backgroundColor: Colors.indigoAccent
            ),
            body: Container(
                color: Colors.indigo[300],
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(12),
                child: Consumer<FavoritesRepository>(
                    builder: (context, favorites, child){
                        return favorites.list.isEmpty ? ListTile(
                                leading: Icon(Icons.star),
                                title: Text("There are currently no favorite coins")
                            )
                            :
                            ListView.builder(
                                itemCount: favorites.list.length,
                                itemBuilder: (_, index) {
                                    return CoinCard(coin: favorites.list[index]);
                                }
                            );
                    }
                )
            )
        );
    }
}
