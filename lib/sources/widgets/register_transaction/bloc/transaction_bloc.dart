
import 'package:dindin_app/library.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {

    on<TransactionInitialState>(onTransactionInitialState);

    on<ChangeTransactionType>(onChangeTransactionType);

    on<ChangeTransactionValue>(onChangeTransactionValue);

    on<RollbackTransaction>(onRollbackTransaction);

    on<DetailsTransaction>(onDetailsTransaction);

  }

  void onTransactionInitialState(TransactionInitialState event, Emitter<TransactionState> emit) {
    emit(TransactionInitial());
  }

  void onChangeTransactionType(ChangeTransactionType event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(tipoTransacao: event.tipoTransacao));
  }

  void onChangeTransactionValue(ChangeTransactionValue event, Emitter<TransactionState> emit) async {
    String valorTotal = state.valorTransacao;
    // Condição para limite do valor
    if (valorTotal.length < 12) {
      valorTotal = valorTotal + event.valor;
      emit(state.copyWith(valorTransacao: valorTotal));
    }
  }

  void onRollbackTransaction(RollbackTransaction event, Emitter<TransactionState> emit) async {
    String valorTotal = state.valorTransacao;
    if (valorTotal.length > 1) {
      valorTotal = valorTotal.substring(0, valorTotal.length - 1);
      emit(state.copyWith(valorTransacao: valorTotal));
    }
  }

  void onDetailsTransaction(DetailsTransaction event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(onDetails: true));
  }
}
