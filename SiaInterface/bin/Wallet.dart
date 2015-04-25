library Wallet;

class WalletAddress {
  String Address;
  WalletAddress(this.Address);
  WalletAddress copy() => new WalletAddress(Address);
}

class WalletSend{
  int Amount;
  String Destination;

  WalletSend(this.Amount, this.Destination);
  WalletSend copy() => new WalletSend(Amount, Destination);
}


class WalletStatus{
  int Balance;
  int FullBalance;
  int NumAddress;

  WalletStatus(this.Balance, this.FullBalance, this.NumAddress);
  WalletStatus copy() => new WalletStatus(Balance, FullBalance, NumAddress);

}
  




