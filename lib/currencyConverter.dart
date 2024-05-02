import 'package:flutter/material.dart';


class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController rupiahController = TextEditingController();
  double result = 0.0;

  void convertCurrency() {
    double rupiah = double.tryParse(rupiahController.text) ?? 0.0;
    // Set your currency conversion rate here
    double conversionRate = 0.000069; // 1 Rupiah = 0.000069 USD (as an example)
    double convertedCurrency = rupiah * conversionRate;
    setState(() {
      result = convertedCurrency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: rupiahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter amount in Rupiah',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: \$${result.toStringAsFixed(2)}', // Display result in USD
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
