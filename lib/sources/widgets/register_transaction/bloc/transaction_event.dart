part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class TransactionInitialState extends TransactionEvent {}

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

class RollbackTransaction extends TransactionEvent {}

class DetailsTransaction extends TransactionEvent {

}