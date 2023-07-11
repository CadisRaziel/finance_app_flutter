// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:finance/models/transaction_model.dart';
import 'package:flutter/material.dart';

import 'package:finance/repositories/transaction_repository.dart';
import 'package:finance/view/home/home_state.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  HomeController(this._transactionRepository);

  HomeState _state = HomeitialState();
  HomeState get state => _state;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransaction() async {
    _changeState(HomeLoadingState());
    try {
      // throw Exception(); // -> simular erro      
      _transactions = await _transactionRepository.getAllTransactions();      
      _changeState(HomeSucessState());
      
    } catch (e) {
      _changeState(HomeErrorState(e.toString()));
    }
  }
}
