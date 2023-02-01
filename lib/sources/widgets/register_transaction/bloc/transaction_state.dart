part of 'transaction_bloc.dart';

class TransactionState {
  TransactionType tipoTransacao;
  String valorTransacao;
  bool onDetails;

  TransactionState({
    required this.tipoTransacao,
    required this.valorTransacao,
    required this.onDetails,
  });

  TransactionState copyWith({
    TransactionType? tipoTransacao,
    String? valorTransacao,
    bool? onDetails,
}) {
    return TransactionState(
      tipoTransacao: tipoTransacao ?? this.tipoTransacao,
      valorTransacao: valorTransacao ?? this.valorTransacao,
      onDetails: onDetails ?? this.onDetails,
    );
  }
}

class TransactionInitial extends TransactionState {
  TransactionInitial() : super(
    tipoTransacao: TransactionType.entrada,
    valorTransacao: "0",
    onDetails: false,
  );
}



