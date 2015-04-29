library SiaInterface.Transactionpool;
import 'Abstract.dart';

class TransactionpoolTransactions extends Abstract {
  bool Complete;
  var Transactions;
  TransactionpoolTransactions(Map jsonFormat, this.Transactions) :super(jsonFormat);
  TransactionpoolTransactions copy() => new TransactionpoolTransactions(jsonFormat, Transactions);
}
