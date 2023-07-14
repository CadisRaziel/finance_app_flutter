import 'package:cloud_functions/cloud_functions.dart';
import 'package:finance/models/user_model.dart';
import 'package:finance/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;
  final _functions = FirebaseFunctions.instance;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return UserModel(
            name: result.user!.displayName,
            email: result.user!.email,
            id: result.user!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Aconteceu um erro ao logar';
    } catch (e) {
      rethrow; // -> lançamento da exception do else acima
    }
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    try {
      //!abaixo temos a função do firebase, porém como incluimos hasura function temos que usa-la e comitar a do firebase
      // final result = await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password);

      //!chamando a functions
      await _functions.httpsCallable('registerUser').call({
        "email": email,
        "password": password,
        "displayName": name,
      });
      //!como agora não criamos mais pelo firebase e sim pela function da cloud abaixo passamos o signIn do firebase
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        log(await _auth.currentUser?.getIdToken(true) ?? 'nulo'); //Token do firebase (true) -> força a atualização do token
        await result.user!.updateDisplayName(name);
        return UserModel(
          name: _auth.currentUser?.displayName,
          email: _auth.currentUser?.email,
          id: _auth.currentUser?.uid,
        );
      } else {
        throw Exception();
      }
    } on FirebaseFunctionsException catch (e) {
      throw e.message ?? 'Aconteceu um erro ao logar na cloud';
    }on FirebaseAuthException catch (e) {
      throw e.message ?? 'Aconteceu um erro ao logar no firebase';
    } catch (e) {
      rethrow; // -> lançamento da exception do else acima
    }
  }

  @override
  Future<void> signOut() async {
   try {
    //sair da conta
     await _auth.signOut();
   } catch (e) {
      rethrow;
   }
  }
}
