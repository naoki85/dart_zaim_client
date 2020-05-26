import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance', () {
    const Map<String, dynamic> data = {
      "id": 58,
      "user_id": 1,
      "genre_id": 10101,
      "category_id": 7,
      "account_id": 3,
      "transfer_account_id": 0,
      "mode": "payment",
      "place_uid": "zm-098f6bcd4621d373",
      "service": "place",
      "name": "test",
      "original_name": "test",
      "tel": "",
      "count": 2,
      "place_pattern_id": 0,
      "calc_flag": 10,
      "edit_flag": 0,
      "active": 1,
      "modified": "2017-06-28 18:24:51",
      "created": "2016-12-07 23:37:48"
    };
    final place = ZaimPlace(data);
    expect(place.id, 58);
    expect(place.userId, 1);
    expect(place.genreId, 10101);
    expect(place.categoryId, 7);
    expect(place.accountId, 3);
    expect(place.transferAccountId, 0);
    expect(place.mode, 'payment');
    expect(place.placeUid, 'zm-098f6bcd4621d373');
    expect(place.service, 'place');
    expect(place.name, 'test');
    expect(place.tel, '');
    expect(place.count, 2);
    expect(place.placePatternId, 0);
    expect(place.calcFlag, 10);
    expect(place.editFlag, 0);
    expect(place.active, 1);
    expect(place.modified, '2017-06-28 18:24:51');
    expect(place.created, '2016-12-07 23:37:48');
  });
}
