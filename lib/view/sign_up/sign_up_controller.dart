// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:finance/services/auth_service.dart';
import 'package:finance/services/graphql_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:finance/view/sign_up/sign_up_state.dart';

class SignUpController extends ChangeNotifier {
  final AuthService authService; //Repare que eu injeto a interface
  final SecureStorage secureStorage;
  final GraphqlService graphqlService;

  SignUpController({
    required this.authService,
    required this.secureStorage,
    required this.graphqlService,
  });

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
      final user = await authService.signUp(
        name: name,
        email: email,
        password: password,
      );

      //salvando usuario no secureStorage
      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );

        //chamando a api do graphql após ter a certeza que ja tem um usuario
        await graphqlService.init();
      
        _changeState(SignUpSucessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
