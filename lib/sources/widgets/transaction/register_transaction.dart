import 'package:dindin_app/library.dart';

class RegisterTransaction extends StatefulWidget {
  const RegisterTransaction({super.key});

  @override
  State<RegisterTransaction> createState() => _RegisterTransactionState();
}

class _RegisterTransactionState extends State<RegisterTransaction> {

  final _descricaoController = TextEditingController();
  ValueNotifier<DateTime> _dateNotifier = ValueNotifier(DateTime.now());

  @override
  void initState() {
    BlocProvider.of<TransactionBloc>(context).add(
      TransactionInitialize(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return BlocConsumer<TransactionBloc, TransactionState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == TransactionStatus.created) {
          BlocProvider.of<HomeBloc>(context).add(
            UpdateTransactions(),
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: state.tipoTransacao == TransactionType.entrada
                    ? theme.colorScheme.secondaryContainer
                    : theme.colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<TransactionBloc>(context).add(
                                    ChangeTransactionType(
                                      tipoTransacao: TransactionType.entrada,
                                    ),
                                  );
                                },
                                child: Text(
                                  "Entrada",
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: state.tipoTransacao == TransactionType.entrada
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              onPressed: () {
                                BlocProvider.of<TransactionBloc>(context).add(
                                  ChangeTransactionType(
                                    tipoTransacao: TransactionType.saida,
                                  ),
                                );
                              },
                              child: Text(
                                "Saida",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: state.tipoTransacao == TransactionType.saida
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 30,
                            right: 30,
                          ),
                          child: Text(
                            state.valorTransacao.convertToMoeda,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.headlineLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: screen.size.height * 0.7,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 8,
                          width: screen.size.width * 0.45,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.inverseSurface,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: ValueNotifier<bool>(state.onDetails),
                        builder: (context, value, child) {
                          if (value != true) {
                            return Column(
                              children: [
                                const CustomKeyboard(),
                                SizedBox(
                                  width: screen.size.width * 0.70,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 24,
                                    ),
                                    child: ElevatedButton(
                                      child: const Text('Pronto'),
                                      onPressed: () {
                                        if (state.valorTransacao != "0") {
                                          BlocProvider.of<TransactionBloc>(context).add(
                                            DetailsTransaction(),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox(
                              height: screen.size.height * 0.62,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                      ),
                                      child: CustomDropdownButton(
                                        labelText: 'Categoria',
                                        selectValue: state.categorias.first,
                                        items: state.categorias.map((Categoria item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              item.descricao!,
                                              style: theme.textTheme.bodyLarge?.copyWith(
                                                color: theme.colorScheme.inversePrimary,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: <Categoria>(value) async {
                                          BlocProvider.of<TransactionBloc>(context).add(
                                            ChangeCategoriaTransaction(
                                              categoria: value,
                                            ),
                                          );
                                        },
                                        validator: (value) => value == null ? 'Campo Obrigatório' : null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                      ),
                                      child: CustomTextForm(
                                        labelText: "Descrição",
                                        controller: _descricaoController,
                                        textInputAction: TextInputAction.none,
                                        keyboardType: TextInputType.text,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) => value == null || value == ''
                                            ? 'Campo obrigatório'
                                            : null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                      ),
                                      child: PickerDateTime(
                                        dateNotifier: _dateNotifier,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screen.size.width * 0.70,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 50,
                                        ),
                                        child: ElevatedButton(
                                          child: const Text('Adicionar'),
                                          onPressed: () {
                                            BlocProvider.of<TransactionBloc>(context).add(
                                              CreateTransaction(
                                                descricao: _descricaoController.text,
                                                data: _dateNotifier.value,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                         }
                       }
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
