import 'package:test/test.dart';
import 'package:flutter_application_1/models/conta_bancaria.dart';
import 'package:flutter_application_1/models/pessoa_fisica.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/pessoa_juridica.dart';

void main() {
  test('Deve depositar o valor correto na conta', () {
    var cliente = PessoaFisica(nome: 'João Silva', cpf: '123.456.789-00');
    var conta = ContaBancaria<PessoaFisica>(cliente: cliente);

    conta.depositar(500);

    expect(conta.consultarSaldo(), 500.0);
  });

  test('Deve sacar o valor correto da conta', () {
    var cliente = PessoaFisica(nome: 'Maria Souza', cpf: '987.654.321-00');
    var conta = ContaBancaria<PessoaFisica>(cliente: cliente);

    conta.depositar(1000);
    conta.sacar(300);

    expect(conta.consultarSaldo(), 700.0);
  });

  test('Deve lançar exceção se o saldo for insuficiente', () {
    var cliente =
        PessoaJuridica(razaoSocial: 'Empresa ABC', cnpj: '01.123.456/0001-01');
    var conta = ContaBancaria<PessoaJuridica>(cliente: cliente);

    conta.depositar(200);

    expect(() => conta.sacar(500), throwsException);
  });
}
