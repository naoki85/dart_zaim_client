import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance', () {
    const Map<String, dynamic> data = {
      "id": 381,
      "mode": "income",
      "user_id": 1,
      "date": "2011-11-07",
      "category_id": 11,
      "genre_id": 0,
      "to_account_id": 34555,
      "from_account_id": 0,
      "amount": 10000,
      "comment": "",
      "active": 1,
      "name": "",
      "receipt_id": 0,
      "place": "",
      "created": "2011-11-07 01:10:50",
      "currency_code": "JPY",
    };
    final money = ZaimMoney(data);
    expect(money.id, 381);
    expect(money.mode, "income");
    expect(money.userId, 1);
    expect(money.date, "2011-11-07");
    expect(money.categoryId, 11);
    expect(money.genreId, 0);
    expect(money.toAccountId, 34555);
    expect(money.fromAccountId, 0);
    expect(money.amount, 10000);
    expect(money.comment, "");
    expect(money.active, 1);
    expect(money.name, "");
    expect(money.receiptId, 0);
    expect(money.place, "");
    expect(money.created, "2011-11-07 01:10:50");
    expect(money.currencyCode, "JPY");
  });
}
