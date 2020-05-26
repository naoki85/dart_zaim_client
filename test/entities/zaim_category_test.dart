import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance from default category data', () {
    const Map<String, dynamic> data = {
      "id": 101,
      "mode": "payment",
      "name": "Food"
    };
    final category = ZaimCategory(data);
    expect(category.id, 101);
    expect(category.mode, "payment");
    expect(category.name, "Food");
    expect(category.sort, null);
    expect(category.parentCategoryId, null);
    expect(category.active, null);
    expect(category.modified, null);
  });

  test('build a instance from category data user created', () {
    const Map<String, dynamic> data = {
      "id": 12093,
      "name": "Food",
      "mode": "payment",
      "sort": 1,
      "parent_category_id": 101,
      "active": 1,
      "modified": "2013-01-01 00:00:00"
    };
    final category = ZaimCategory(data);
    expect(category.id, 12093);
    expect(category.name, "Food");
    expect(category.mode, "payment");
    expect(category.sort, 1);
    expect(category.parentCategoryId, 101);
    expect(category.active, 1);
    expect(category.modified, "2013-01-01 00:00:00");
  });
}
