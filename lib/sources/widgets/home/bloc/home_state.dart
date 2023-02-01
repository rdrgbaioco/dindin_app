part of 'home_bloc.dart';

class HomeState {
  int index;
  String nome;
  String saldo;
  Transacoes transacoes;
  Transacoes lastTransacoes;

  HomeState({
    required this.index,
    required this.nome,
    required this.saldo,
    required this.transacoes,
    required this.lastTransacoes,
  });

  HomeState copyWith({
    int? index,
    String? nome,
    String? saldo,
    Transacoes? transacoes,
    Transacoes? lastTransacoes,
  }) {
    return HomeState(
      index: index ?? this.index,
      nome: nome ?? this.nome,
      saldo: saldo ?? this.saldo,
      transacoes: transacoes ?? this.transacoes,
      lastTransacoes: lastTransacoes ?? this.lastTransacoes,
    );
  }
}

class HomeInitalState extends HomeState {
  HomeInitalState() : super(
    index: 0,
    nome: "",
    saldo: "",
    transacoes: [],
    lastTransacoes: [],
  );
}
