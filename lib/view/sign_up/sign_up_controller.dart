import 'package:finance/services/auth_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:finance/view/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _authService; //Repare que eu injeto a interface
   final  SecureStorage _secureStorage;
  SignUpController(this._authService, this._secureStorage);
  var logger = Logger();

  SignUpState _state = SignUpInitialState();
  SignUpState get state => _state;
  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {


   


    _changeState(SignUpLoadingState());
    try {
      //criando usuario
      final user = await _authService.signUp(
        name: name,
        email: email,
        password: password,
      );

      //salvando usuario no secureStorage
      if (user.id != null) {
        await _secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
        _changeState(SignUpSucessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
