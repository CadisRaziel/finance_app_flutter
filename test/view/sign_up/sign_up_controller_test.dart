import 'package:finance/models/user_model.dart';
import 'package:finance/view/sign_up/sign_up_controller.dart';
import 'package:finance/view/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockSecureStorage = MockSecureStorage();
    signUpController = SignUpController(mockFirebaseAuthService, mockSecureStorage);
    user = UserModel(
      name: "User",
      email: "user@hotmail.com",
      id: "1a2b3c4d53",
    );
  });

  test("Test sign up sucess state", () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(
      () => mockSecureStorage.write(
        key: "CURRENT_USER",
        value: user.toJson(),
      ),
    ).thenAnswer((_) async {});

    when(
        () => mockFirebaseAuthService.signUp(
          name: "User",
          email: "user@hotmail.com",
          password: "User@123" ,
        ),
      ).thenAnswer(
        (_) async => user,
      );

    await signUpController.signUp(
      name: "User",
      email: "user@email.com",
      password: "User@123",
    );
    expect(signUpController.state, isInstanceOf<SignUpSucessState>());
  });
}
