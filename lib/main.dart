import 'package:flutter/material.dart';
import 'models/conta_bancaria.dart';
import 'models/pessoa_fisica.dart';
import 'models/pessoa_juridica.dart';

void main() {
  var cliente1 = PessoaFisica(nome: 'João Silva', cpf: '123.456.789-00');
  var contaPessoaFisica = ContaBancaria<PessoaFisica>(cliente: cliente1);
  
  var cliente2 = PessoaJuridica(razaoSocial: 'Empresa XYZ', cnpj: '00.000.000/0001-00');
  var contaPessoaJuridica = ContaBancaria<PessoaJuridica>(cliente: cliente2);
  
  contaPessoaFisica.depositar(1000);
  contaPessoaJuridica.depositar(5000);
  
  print('Saldo da conta PF: ${contaPessoaFisica.consultarSaldo()}');
  print('Saldo da conta PJ: ${contaPessoaJuridica.consultarSaldo()}');
}
