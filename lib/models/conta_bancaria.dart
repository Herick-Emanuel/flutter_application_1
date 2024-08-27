class ContaBancaria<T> {
  final T cliente;
  double saldo;

  ContaBancaria({required this.cliente, this.saldo = 0.0});

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
    } else {
      throw Exception('Saldo insuficiente');
    }
  }

  double consultarSaldo() {
    return saldo;
  }
}
