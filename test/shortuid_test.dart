import 'package:test/test.dart';
import 'package:shortuid/shortuid.dart';

void main() {
  test('uid to sid', () {
    final uuidv4 = 'd07b31c0-54d9-44d4-993d-ef8101ee1dad';
    final shortuid = ShortUid.from_uid(uuidv4);
    final original = ShortUid.decode_to_uid(shortuid);
    expect(original, uuidv4);
  });
  test('create', () {
    final shortuid = ShortUid.create();
    expect(shortuid.isNotEmpty, isTrue);
  });
}
