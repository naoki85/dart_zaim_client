import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance', () {
    const Map<String, dynamic> data = {
      "currency_code": "AUD",
      "unit": '\$',
      "name": "Australian dollar",
      "point": 2
    };
    final currency = ZaimCurrency(data);
    expect(currency.currencyCode, "AUD");
    expect(currency.unit, '\$');
    expect(currency.name, 'Australian dollar');
    expect(currency.point, 2);
  });
}
