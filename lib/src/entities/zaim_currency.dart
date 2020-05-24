part of dart_zaim_client;

class ZaimCurrency {
  String currencyCode;
  String unit;
  String name;
  int point;

  ZaimCurrency(Map<String, dynamic> currency) {
    this.currencyCode = currency['currency_code'];
    this.unit = currency['unit'];
    this.name = currency['name'];
    this.point = currency['point'];
  }
}
