import 'package:finance/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_classes.dart';

void main() {
  late MockFirebaseAuthService mockClasses;
  late UserModel user;
  setUp(() {
    mockClasses = MockFirebaseAuthService();
    user = UserModel(
      name: "User",
      email: "user@hotmail.com",
      id: "1a2b3c4d53",
    );
  });

  group("Tests sign up", () {
    test("Test sign up success", () async {
      when(
        () => mockClasses.signUp(
          name: "User",
          email: "user@hotmail.com",
          password: "user@123",
        ),
      ).thenAnswer(
        (invocation) async => user,
      );
      final result = await mockClasses.signUp(
        name: "User",
        email: "user@hotmail.com",
        password: "user@123",
      );
      expect(
        result,
        user,
      );
    });

    test("Test sign up failure", () async {
      when(
        () => mockClasses.signUp(
          name: "User",
          email: "user@hotmail.com",
          password: "user@123",
        ),
      ).thenThrow(
        Exception(),
      );
      expect(
        () => mockClasses.signUp(
          name: "User",
          email: "user@hotmail.com",
          password: "user@123",
        ),
        throwsException,
        // throwsA(isInstanceOf<Exception>())
      );
    });
  });
}
