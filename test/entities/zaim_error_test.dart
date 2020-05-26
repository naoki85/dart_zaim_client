import 'package:test/test.dart';
import 'package:dart_zaim_client/dart_zaim_client.dart';

void main() {
  test('build a instance', () {
    final error = ZaimError(401, '401 Unauthorized');
    expect(error.status, 401);
    expect(error.message, '401 Unauthorized');
  });
}
