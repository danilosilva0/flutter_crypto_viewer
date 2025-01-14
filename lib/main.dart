import 'package:flutter/material.dart';
import 'package:flutter_crypto_viewer/pages/home_page.dart';
import 'package:flutter_crypto_viewer/repositories/favorites_repository.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(
        ChangeNotifierProvider(
            create: (context) => FavoritesRepository(),
            child: MyApp()      
        )
    );
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Crypto Data Viewer",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.indigo
            ),
            home: HomePage()
        );
    }
}
