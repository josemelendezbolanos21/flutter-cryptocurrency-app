import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Crypto app"),
    ),
    body: crytoWidget(),
  );

  Widget crytoWidget() => Container(
    child: Column(
      children: <Widget>[
        Flexible(
        child: ListView.builder(
          itemCount: widget.currencies.length,
          itemBuilder: (BuildContext context, int index) {
            final Map currency = widget.currencies[index];
            final MaterialColor color = _colors[index % _colors.length];
            return _getListItemUi(currency, color);
          },
        ),
      ),
          ], 
    )
  );

  Widget _getListItemUi(Map currency, MaterialColor color) => ListTile(
    leading: CircleAvatar(
      backgroundColor: color,
      child: Text(currency["name"][0]),
    ),
    title: Text(
      currency["name"], style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
    isThreeLine: true,
  );

  Widget _getSubtitleText(String priceUSD, String percentageChange ) {
    TextSpan priceTextWidget = new TextSpan(
      text: "\$$priceUSD\n",
      style: TextStyle(color: Colors.black),
    );
    String percentageChangeText = '1 hour: $percentageChange%';

    var textColor;
    if(double.parse(percentageChange)>=0) {
      textColor = Colors.green;
    } else {
      textColor = Colors.red;
    }

    TextSpan percentageChangeTextWidget = TextSpan(
      text: percentageChangeText,
      style: TextStyle(
        color: textColor,
      )
    );

    return RichText(
      text: TextSpan(
        children: [
          priceTextWidget,
          percentageChangeTextWidget,
        ]
      ),
    );
  }
}



