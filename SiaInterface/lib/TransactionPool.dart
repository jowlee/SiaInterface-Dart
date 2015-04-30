library SiaInterface.Transactionpool;
import 'Response.dart';

class TransactionpoolTransactions extends Response {
  bool Complete;
  var Transactions;
  TransactionpoolTransactions(String jsonFormat, this.Transactions) :super(jsonFormat);
  TransactionpoolTransactions copy() => new TransactionpoolTransactions(jsonFormat, Transactions);
}
