import 'package:finance/models/transaction_model.dart';
import 'package:finance/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransaction() {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      //Para simular vazio é só deixa um array vazio.
      TransactionModel(
          title: "Salary",
          value: 500,
          date: DateTime.now().millisecondsSinceEpoch),
      TransactionModel(
        title: "Dinner",
        value: -50,
        date: DateTime.now()
            .subtract(
              const Duration(days: 7),
            )
            .millisecondsSinceEpoch, //-> subtract retirar / millisecondsSinceEpoch -> converter pra int
      )
    ];
  }
}
