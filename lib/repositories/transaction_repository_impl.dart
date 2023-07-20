import 'dart:developer';

import 'package:finance/core/shared/queries/get_all_transactions.dart';
import 'package:finance/locator.dart';
import 'package:finance/models/transaction_model.dart';
import 'package:finance/repositories/transaction_repository.dart';
import 'package:finance/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final client = locator.get<GraphqlService>().client;
  @override
  Future<void> addTransaction() {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    try {
      final response =
          await client.query(QueryOptions(document: gql(qGetAllTransactions)));
      log(response.data.toString());
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
