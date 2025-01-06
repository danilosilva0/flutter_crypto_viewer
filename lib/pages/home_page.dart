import "package:flutter/material.dart";
import "package:flutter_crypto_viewer/pages/coins_page.dart";

import "favorites_page.dart";

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int currentPage = 0;
    late PageController? pc;

    @override
    void initState() {
        super.initState();
        pc = PageController(initialPage: currentPage);
    }

    setCurrentPage(page) {
      setState(() {
        currentPage = page;
      });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: PageView(
                controller: pc,
                onPageChanged: setCurrentPage,
                children: [
                  CoinsPage(),
                  FavoritesPage()
                ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentPage,
                items: [
                    BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
                    BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
                ],
                onTap: (page) {
                    pc?.animateToPage(page, duration: Duration(milliseconds: 400), curve: Curves.ease);
                }
            )
        );
    }
}
