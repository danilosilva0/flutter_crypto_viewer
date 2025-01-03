import 'package:flutter_crypto_viewer/models/coin.dart';

class CoinRepository {
    static List<Coin> table = [
        Coin(icon: "images/bitcoin.png", name: "Bitcoin", abbreviation: "BTC", price: 99999.00),
        Coin(icon: 'images/ethereum.png', name: 'Ethereum', abbreviation: 'ETH', price: 9716.00),
        Coin(icon: 'images/xrp.png', name: 'XRP', abbreviation: 'XRP', price: 3.34),
        Coin(icon: 'images/cardano.png', name: 'Cardano', abbreviation: 'ADA', price: 6.32),
        Coin(icon: 'images/usdcoin.png', name: 'USD Coin', abbreviation: 'USDC', price: 5.02),
        Coin(icon: 'images/litecoin.png', name: 'Litecoin', abbreviation: 'LTC', price: 669.93)
    ];
}
