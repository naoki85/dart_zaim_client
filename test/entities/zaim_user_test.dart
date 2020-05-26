import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance', () {
    const Map<String, dynamic> data = {
      "id": 10000000,
      "login": "XXXXXXX",
      "name": "MyName",
      "input_count": 100,
      "day_count": 10,
      "repeat_count": 2,
      "day": 1,
      "week": 3,
      "month": 7,
      "currency_code": "JPY",
      "profile_image_url": "http://xxx.xxxx/yyy.jpg",
      "cover_image_url": "http://xxx.xxxx/xxx.jpg",
      "profile_modified": "2011-11-07 16:47:43",
    };
    final user = ZaimUser(data);
    expect(user.id, 10000000);
    expect(user.login, 'XXXXXXX');
    expect(user.name, 'MyName');
    expect(user.inputCount, 100);
    expect(user.dayCount, 10);
    expect(user.repeatCount, 2);
    expect(user.day, 1);
    expect(user.week, 3);
    expect(user.month, 7);
    expect(user.currencyCode, 'JPY');
    expect(user.profileImageUrl, 'http://xxx.xxxx/yyy.jpg');
    expect(user.coverImageUrl, 'http://xxx.xxxx/xxx.jpg');
    expect(user.profileModified, '2011-11-07 16:47:43');
  });
}
