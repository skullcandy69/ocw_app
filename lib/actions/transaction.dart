
import 'package:ocw_app/models/transaction/transaction.dart';

class FetchTransaction {
  List<Transaction> transactions;

  FetchTransaction(this.transactions);
}

class AddTransaction {
  Transaction transaction;

  AddTransaction(this.transaction);
}
