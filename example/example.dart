import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

const String ZAIM_CONSUMER_KEY = 'YOUR_CONSUMER_KEY';
const String ZAIM_CONSUMER_SECRET = 'YOUR_CONSUMER_SECRET';

final zaimConfig = ZaimConfig(ZAIM_CONSUMER_KEY, ZAIM_CONSUMER_SECRET);

// ...

class _DartZaimApiSampleState extends State<MyHomePage> {
  ZaimAuthorization auth = ZaimAuthorization(zaimConfig);
  String _oauthVerifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Click to open authorization page'),
              onPressed: () async {
                await auth.getRequestTokenUrl('http://localhost').then((url) {
                  // After getting authorization url, open the authorization page.
                  // For example, use url_launcher
                  launch(url);
                });
              },
            ),
            TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  _oauthVerifier = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter a OAuth verifier',
                )),
            FlatButton(
              child: Text('Get Token and money list'),
              onPressed: () async {
                credentials = await auth.requestToken(_oauthVerifier);
                // Maybe save credentials...

                final client = ZaimClient(zaimConfig, credentials);
                final money = await client.getMoneyList();
                print(money);
                final createMoneyParams =
                    PaymentRequestParameter(100, '2020-05-24', 10101, 101);
                await client.createMoney(
                    ZaimMoneyType.PAYMENT, createMoneyParams);
              },
            ),
          ],
        ),
      ),
    );
  }
}
