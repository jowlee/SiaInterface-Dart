library SiaInterface.Transactionpool;

class TransactionpoolTransactions{
  bool Complete;
  var Transactions;
  TransactionpoolTransactions(this.Transactions);
  TransactionpoolTransactions copy() => new TransactionpoolTransactions(Transactions);
}
