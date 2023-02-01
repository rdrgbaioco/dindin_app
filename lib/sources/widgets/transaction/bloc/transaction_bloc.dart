
import 'package:dindin_app/library.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {

    on<TransactionInitialize>(onTransactionInitialize);

    on<TransactionInitialState>(onTransactionInitialState);

    on<ChangeTransactionType>(onChangeTransactionType);

    on<ChangeTransactionValue>(onChangeTransactionValue);

    on<ChangeCategoriaTransaction>(onChangeCategoriaTransaction);

    on<RollbackTransaction>(onRollbackTransaction);

    on<ClearTransactionValue>(onClearTransactionValue);

    on<DetailsTransaction>(onDetailsTransaction);

    on<CreateTransaction>(onCreateTransaction);

  }

  void onTransactionInitialize(TransactionInitialize event, Emitter<TransactionState> emit) async {
    if (state.categorias.isEmpty) {
      final storage = Storage();
      final token = await storage.getToken();
      final repository = DetalhesRepository();
      Categorias categorias = await repository.getCategorias(token: token);
      emit(state.copyWith(categorias: categorias));
    } else {
      emit(state.copyWith(
        valorTransacao: "0",
        tipoTransacao: TransactionType.entrada,
        onDetails: false,
      ));
    }
  }

  void onTransactionInitialState(TransactionInitialState event, Emitter<TransactionState> emit) async {
    emit(TransactionInitial());
  }

  void onChangeTransactionType(ChangeTransactionType event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(tipoTransacao: event.tipoTransacao));
  }

  void onChangeTransactionValue(ChangeTransactionValue event, Emitter<TransactionState> emit) async {
    String valorTotal = state.valorTransacao;
    // Condição para limite do valor
    if (valorTotal.length < 12) {
      // Condição para não preencher o limite de casas com zeros
      if (valorTotal == "0" && event.valor == "0") {
        valorTotal = valorTotal;
      } else {
        valorTotal = valorTotal + event.valor;
        print(valorTotal);
        emit(state.copyWith(valorTransacao: valorTotal));
      }

    }
  }

  void onChangeCategoriaTransaction(ChangeCategoriaTransaction event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(categoria: event.categoria));
  }

  void onRollbackTransaction(RollbackTransaction event, Emitter<TransactionState> emit) async {
    String valorTotal = state.valorTransacao;
    if (valorTotal.length > 1) {
      valorTotal = valorTotal.substring(0, valorTotal.length - 1);
      emit(state.copyWith(valorTransacao: valorTotal));
    }
  }

  void onClearTransactionValue(ClearTransactionValue event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(valorTransacao: "0"));
  }

  void onDetailsTransaction(DetailsTransaction event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(onDetails: true));
  }

  void onCreateTransaction(CreateTransaction event, Emitter<TransactionState> emit) async {
    try {
      final storage = Storage();
      final token = await storage.getToken();
      Transacao transacao = Transacao(
        tipo: state.tipoTransacao.tipo,
        descricao: event.descricao,
        valor: int.parse(state.valorTransacao),
        data: event.data.toIso8601String(),
        categoriaId: state.categoria.id,
      );

      final repository = TransacoesRepository();
      repository.createTransacao(
        token: token,
        transacao: transacao,
      );
      emit(state.copyWith(status: TransactionStatus.created));

    } on Error {
      emit(state.copyWith(status: TransactionStatus.error));
    } finally {
      emit(state.copyWith(status: TransactionStatus.idle));
    }

  }

}
