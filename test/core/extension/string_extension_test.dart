import 'package:flutter_test/flutter_test.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';

void main() {
  group('StringExtension - getInitial', () {
    test('returns first letter in uppercase', () {
      expect('ram'.getInitial, 'R');
    });

    test('works with already uppercase string', () {
      expect('Ram'.getInitial, 'R');
    });

    test('works with single character', () {
      expect('a'.getInitial, 'A');
    });
    test('return empty for empty data', () {
      expect(''.getInitial, '');
    });
  });

  group('StringExtension - isOnline', () {
    test('returns true when lastSeen is within 1 minute', () {
      final DateTime now = DateTime.now();
      final String lastSeen = now
          .subtract(const Duration(minutes: 1))
          .toString();

      expect(lastSeen.isOnline, true);
    });

    test('returns false when lastSeen is more than 1 minute', () {
      final DateTime now = DateTime.now();
      final String lastSeen = now
          .subtract(const Duration(minutes: 2))
          .toString();

      expect(lastSeen.isOnline, false);
    });
  });

  group('StringExtension - toLastSeen', () {
    test('returns Online when within 1 minute', () {
      final String lastSeen = DateTime.now()
          .subtract(const Duration(seconds: 30))
          .toString();

      expect(lastSeen.toLastSeen(), 'Online');
    });

    test('returns minutes ago correctly', () {
      final String lastSeen = DateTime.now()
          .subtract(const Duration(minutes: 5))
          .toString();

      expect(lastSeen.toLastSeen(), '5 min ago');
    });

    test('returns hours ago correctly', () {
      final String lastSeen = DateTime.now()
          .subtract(const Duration(hours: 2))
          .toString();

      expect(lastSeen.toLastSeen(), '2 hours ago');
    });

    test('returns Yesterday correctly', () {
      final String lastSeen = DateTime.now()
          .subtract(const Duration(days: 1))
          .toString();

      expect(lastSeen.toLastSeen(), 'Yesterday');
    });

    test('returns days ago correctly', () {
      final String lastSeen = DateTime.now()
          .subtract(const Duration(days: 3))
          .toString();

      expect(lastSeen.toLastSeen(), '3 days ago');
    });

    test('returns formatted date when more than 5 days', () {
      final DateTime date = DateTime.now().subtract(const Duration(days: 10));
      final String lastSeen = date.toString();

      final String result = lastSeen.toLastSeen();
      expect(result.contains('${date.year}'), true);
    });
  });
}
