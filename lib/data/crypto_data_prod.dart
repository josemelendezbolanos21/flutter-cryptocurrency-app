import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cryptocurrency_app/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository{
  String cryptoApiUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=10";
  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoApiUrl);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if(statusCode != 200 || responseBody == null) {
      throw FetchDataException("An error ocurred: [Status Code: $statusCode]");
    }
    return responseBody.map((currency) => Crypto.fromMap(currency)).toList();
  } 
}