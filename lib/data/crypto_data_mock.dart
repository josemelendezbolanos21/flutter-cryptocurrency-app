import 'dart:async';
import 'package:cryptocurrency_app/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() => Future.value(currencies);
}

var currencies = <Crypto>[
  Crypto( name: 'Bitcoin', price_usd: "10100.34", percent_change_1h: "0.24"),
  Crypto( name: 'Ethereum', price_usd: "189.26", percent_change_1h: "0.18"),
  Crypto( name: 'Ripple', price_usd: "0.26", percent_change_1h: "-0.02"),
];