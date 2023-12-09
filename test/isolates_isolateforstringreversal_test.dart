import 'package:isolates_isolateforstringreversal/isolates_isolateforstringreversal.dart';
import 'package:test/test.dart';

void main() {
  test('reverseStringInIsolate reverses strings', () async {
    expect(await reverseStringInIsolate('hello'), equals('olleh'));
    expect(await reverseStringInIsolate('Dart'), equals('traD'));
  });

  test('reverseStringInIsolate handles empty string', () async {
    expect(await reverseStringInIsolate(''), equals(''));
  });
}

