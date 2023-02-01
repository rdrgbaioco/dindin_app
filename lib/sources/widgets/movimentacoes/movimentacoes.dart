import 'package:dindin_app/library.dart';

class Movimentacoes extends StatelessWidget {
  const Movimentacoes({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    //DateTime hoje = DateTime.now();
    //print(hoje);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Movimentações',
          style: theme.textTheme.headlineSmall,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                DinDinColors.primaryGradient,
                DinDinColors.secondaryGradient,
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
              child: SizedBox(
                height: screen.size.height * 0.45,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      Transacao transacao = Transacao(
                        categoriaId: 3,
                        categoriaNome: 'Saude',
                        descricao: 'Pagamento',
                        valor: 10000,
                        tipo: "entrada",
                      );
                      if (transacao.tipo == "entrada") {
                        return MovimentacaoTile(
                          descricao: transacao.descricao!,
                          categoria: transacao.categoriaNome!,
                          valor: transacao.valor!.toMoedaString,
                          color: theme.colorScheme.primary,
                        );
                      } else {
                        return MovimentacaoTile(
                          descricao: transacao.descricao!,
                          categoria: transacao.categoriaNome!,
                          valor: transacao.valor!.toMoedaString,
                          color: theme.colorScheme.secondary,
                        );
                      }
                    }),
              ),
          ),
        ],
      ),
    );
  }
}
