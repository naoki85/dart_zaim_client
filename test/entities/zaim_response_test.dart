import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a VerifyUserResponse instance', () {
    const name = 'test';
    const requested = 1367902710;
    final response = UserVerifyResponse(ZaimUser({'name': name}), requested);
    expect(response.me.name, name);
    expect(response.requested, requested);
  });

  test('build a MoneyListResponse instance', () {
    const id = 100;
    const requested = 1367902710;
    final response = MoneyListResponse([
      ZaimMoney({'id': id})
    ], requested);
    expect(response.money.length, 1);
    expect(response.money[0].id, id);
    expect(response.requested, requested);
  });

  test('build a CreateMoneyResponse instance', () {
    const id = 100;
    const name = 'test';
    const requested = 1367902710;
    final response = CreateMoneyResponse(
        money: ZaimMoney({'id': id}),
        user: ZaimUser({'name': name}),
        place: null,
        responseRequested: requested);
    expect(response.money.id, id);
    expect(response.user.name, name);
    expect(response.requested, requested);
  });

  test('build a UpdateMoneyResponse instance', () {
    const id = 100;
    const name = 'test';
    const requested = 1367902710;
    final response = UpdateMoneyResponse(
        money: ZaimMoney({'id': id}),
        user: ZaimUser({'name': name}),
        place: null,
        responseRequested: requested);
    expect(response.money.id, id);
    expect(response.user.name, name);
    expect(response.requested, requested);
  });

  test('build a DeleteMoneyResponse instance', () {
    const id = 100;
    const name = 'test';
    const requested = 1367902710;
    final response = DeleteMoneyResponse(
        ZaimMoney({'id': id}), ZaimUser({'name': name}), requested);
    expect(response.money.id, id);
    expect(response.user.name, name);
    expect(response.requested, requested);
  });

  test('build an AccountsResponse instance', () {
    const name = 'test';
    const requested = 1367902710;
    final accounts = [
      ZaimAccount({"name": name})
    ];
    final response = AccountsResponse(accounts, requested);
    expect(response.accounts.length, 1);
    expect(response.accounts[0].name, name);
    expect(response.requested, requested);
  });

  test('build a CategoriesResponse instance', () {
    const name = 'test';
    const requested = 1367902710;
    final categories = [
      ZaimCategory({"name": name})
    ];
    final response = CategoriesResponse(categories, requested);
    expect(response.categories.length, 1);
    expect(response.categories[0].name, name);
    expect(response.requested, requested);
  });

  test('build a GenresResponse instance', () {
    const name = 'test';
    const requested = 1367902710;
    final genres = [
      ZaimGenre({"name": name})
    ];
    final response = GenresResponse(genres, requested);
    expect(response.genres.length, 1);
    expect(response.genres[0].name, name);
    expect(response.requested, requested);
  });

  test('build a CurrenciesResponse instance', () {
    const name = 'AUD';
    const requested = 1367902710;
    final currencies = [
      ZaimCurrency({"name": name})
    ];
    final response = CurrenciesResponse(currencies, requested);
    expect(response.currencies.length, 1);
    expect(response.currencies[0].name, name);
    expect(response.requested, requested);
  });
}
