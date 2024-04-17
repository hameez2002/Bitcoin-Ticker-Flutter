//TODO: Add your imports here.
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'apikey=5A007C0D-47BB-4333-B1ED-2DEF73EAE8BB';

class CoinData {
  CoinData() {}

  //TODO: Create your getCoinData() method here.
  Future getCoinData(String curr) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response =
          await http.get(Uri.parse('$coinAPIURL/$crypto/$curr?$apiKey'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        double lastPrices = data['rate'];
        cryptoPrices[crypto] = lastPrices.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
