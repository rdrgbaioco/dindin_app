import 'package:dindin_app/library.dart';
import 'package:dindin_app/sources/widgets/home/modules/custom_list_tile.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Container(
      height: screen.size.height * 0.55,
      decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.lastTransacoes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.file_download_outlined,
                  size: 50,
                ),
                Text(
                  "Sem movimentos recentes",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Faça sua primeira movimentação\nfinanceira do dia e fique atualizado.",
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.inversePrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 12
                  ),
                  child: Text(
                    "Recentes",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                  child: SizedBox(
                    height: screen.size.height * 0.40,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.lastTransacoes.length,
                        itemBuilder: (context, index) {
                          Transacao transacao = state.lastTransacoes[index];
                          if (transacao.tipo == "entrada") {
                            return CustomListTile(
                              descricao: transacao.descricao!,
                              categoria: transacao.categoriaNome!,
                              valor: transacao.valor!.toMoedaString,
                              icon: Icons.keyboard_arrow_down,
                              color: theme.colorScheme.primary,
                            );
                          } else {
                            return CustomListTile(
                              descricao: transacao.descricao!,
                              categoria: transacao.categoriaNome!,
                              valor: transacao.valor!.toMoedaString,
                              icon: Icons.keyboard_arrow_up,
                              color: theme.colorScheme.secondary,
                            );
                          }
                        }
                     ),
              )),
            ],
          );
        }
      }),
    );
  }
}
