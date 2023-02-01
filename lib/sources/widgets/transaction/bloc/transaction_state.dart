part of 'transaction_bloc.dart';

class TransactionState {
  TransactionType tipoTransacao;
  String valorTransacao;
  bool onDetails;
  Categorias categorias;
  Categoria categoria;
  TransactionStatus status;


  TransactionState({
    required this.tipoTransacao,
    required this.valorTransacao,
    required this.onDetails,
    required this.categorias,
    required this.categoria,
    required this.status,
  });

  TransactionState copyWith({
    TransactionType? tipoTransacao,
    String? valorTransacao,
    bool? onDetails,
    Categorias? categorias,
    Categoria? categoria,
    TransactionStatus? status,
}) {
    return TransactionState(
      tipoTransacao: tipoTransacao ?? this.tipoTransacao,
      valorTransacao: valorTransacao ?? this.valorTransacao,
      onDetails: onDetails ?? this.onDetails,
      categorias: categorias ?? this.categorias,
      categoria: categoria ?? this.categoria,
      status: status ?? this.status,
    );
  }
}

class TransactionInitial extends TransactionState {
  TransactionInitial() : super(
    tipoTransacao: TransactionType.entrada,
    valorTransacao: "0",
    onDetails: false,
    categorias: [],
    categoria: const Categoria(),
    status: TransactionStatus.idle,
  );
}



