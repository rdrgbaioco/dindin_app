import 'package:dindin_app/library.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitalState()) {
    on<HomeInitialize>(onHomeInitialize);

    on<ChangePageIndex>(onChangePageIndex);

    on<UpdateTransactions>(onUpdateTransactions);

  }

  void onHomeInitialize(HomeInitialize event, Emitter<HomeState> emit) async {
    final token = await Storage().getToken();
    final userRepo = UserRepository();
    final detailsRepo = DetalhesRepository();
    final transacaoRepo = TransacoesRepository();
    Usuario usuario = await userRepo.getUser(token: token);
    Extrato extrato = await detailsRepo.getExtrato(token: token);
    Transacoes transacoes = await transacaoRepo.getTransacoes(token: token);
    Transacoes lastTransacoes = await getLastTransacoes(transacoes);
    String saldo = convertSaldo(extrato.entrada!, extrato.saida!);
    emit(state.copyWith(
      nome: usuario.nome,
      saldo: saldo,
      lastTransacoes: lastTransacoes,
    ),);
  }

  void onUpdateTransactions(UpdateTransactions event, Emitter<HomeState> emit) async {
    final token = await Storage().getToken();
    final detailsRepo = DetalhesRepository();
    final transacaoRepo = TransacoesRepository();
    Extrato extrato = await detailsRepo.getExtrato(token: token);
    Transacoes transacoes = await transacaoRepo.getTransacoes(token: token);
    Transacoes lastTransacoes = await getLastTransacoes(transacoes);
    String saldo = convertSaldo(extrato.entrada!, extrato.saida!);
    emit(state.copyWith(
      saldo: saldo,
      lastTransacoes: lastTransacoes,
    ),);
  }

  Future<Transacoes> getLastTransacoes(Transacoes transacoes) async {
    Transacoes result = [];
    await Future.forEach(transacoes, (Transacao element) {
      final diferenca = DateTime.now().difference(DateTime.parse(element.data!)).inDays;
      if (diferenca < 7) {
        result.add(element);
      }
    });
    return result;
  }

  String convertSaldo(int entrada, int saida) {
    int total = entrada - saida;
    return total.toMoedaString;
  }

  void onChangePageIndex(ChangePageIndex event, Emitter<HomeState> emit) async {
    emit(state.copyWith(index: event.index));
  }
}

