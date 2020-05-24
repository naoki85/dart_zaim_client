import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance from default account data', () {
    const Map<String, dynamic> data = {
      "id": 1,
      "name": "Wallet",
    };
    final account = ZaimAccount(data);
    expect(account.id, 1);
    expect(account.name, "Wallet");
    expect(account.mode, null);
    expect(account.sort, null);
    expect(account.parentAccountId, null);
    expect(account.active, null);
    expect(account.modified, null);
  });

  test('build a instance from account data user created', () {
    const Map<String, dynamic> data = {
      "id": 12093,
      "name": "Food",
      "mode": "payment",
      "sort": 1,
      "parent_account_id": 101,
      "active": 1,
      "modified": "2013-01-01 00:00:00"
    };
    final account = ZaimAccount(data);
    expect(account.id, 12093);
    expect(account.name, "Food");
    expect(account.mode, "payment");
    expect(account.sort, 1);
    expect(account.parentAccountId, 101);
    expect(account.active, 1);
    expect(account.modified, "2013-01-01 00:00:00");
  });
}
