part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class TransactionInitialState extends TransactionEvent {}

class TransactionInitialize extends TransactionEvent {}

class ChangeTransactionType extends TransactionEvent {
  final TransactionType tipoTransacao;
  ChangeTransactionType({
    required this.tipoTransacao,
  });
}

class ChangeTransactionValue extends TransactionEvent {
  final String valor;
  ChangeTransactionValue({
    required this.valor,
  });
}

class ChangeCategoriaTransaction extends TransactionEvent {
  final Categoria categoria;
  ChangeCategoriaTransaction({required this.categoria});

}

class RollbackTransaction extends TransactionEvent {}

class ClearTransactionValue extends TransactionEvent {}

class DetailsTransaction extends TransactionEvent {}

class CreateTransaction extends TransactionEvent {
  final String descricao;
  final DateTime data;
  CreateTransaction({
    required this.descricao,
    required this.data,
  });
}