import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance from default genre data', () {
    const Map<String, dynamic> data = {
      "id": 10101,
      "category_id": 101,
      "name": "Grocery"
    };
    final genre = ZaimGenre(data);
    expect(genre.id, 10101);
    expect(genre.name, 'Grocery');
    expect(genre.sort, null);
    expect(genre.active, null);
    expect(genre.categoryId, 101);
    expect(genre.parentGenreId, null);
    expect(genre.modified, null);
  });

  test('build a instance from genre data user created', () {
    const Map<String, dynamic> data = {
      "id": 12093,
      "name": "Geocery",
      "sort": 1,
      "active": 1,
      "category_id": 101,
      "parent_genre_id": 10101,
      "modified": "2013-01-01 00:00:00"
    };
    final genre = ZaimGenre(data);
    expect(genre.id, 12093);
    expect(genre.name, 'Geocery');
    expect(genre.sort, 1);
    expect(genre.active, 1);
    expect(genre.categoryId, 101);
    expect(genre.parentGenreId, 10101);
    expect(genre.modified, "2013-01-01 00:00:00");
  });
}
