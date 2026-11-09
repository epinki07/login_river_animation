import 'package:flutter_test/flutter_test.dart';
import 'package:login_river_animation/login_validation.dart';

void main() {
  test('email requires one address-like value', () {
    expect(isValidEmail('diego@example.com'), isTrue);
    expect(isValidEmail('diego@example'), isFalse);
    expect(isValidEmail('diego example.com'), isFalse);
    expect(isValidEmail('diego@@example.com'), isFalse);
  });

  test('password requires length and each character class', () {
    expect(isValidPassword('Abcdef1!'), isTrue);
    expect(isValidPassword('Abcde1!'), isFalse);
    expect(isValidPassword('abcdef1!'), isFalse);
    expect(isValidPassword('ABCDEF1!'), isFalse);
    expect(isValidPassword('Abcdefg!'), isFalse);
    expect(isValidPassword('Abcdef12'), isFalse);
  });
}
