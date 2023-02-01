import 'package:dindin_app/library.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    return Container(
      margin:  const EdgeInsets.only(
        left: 45,
        right: 45,
      ),
      child: Column(
        children: [
          GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
                int number = numbers[index];
                return KeyNumber(
                  number: "$number",
                  onTap: (value) {
                    BlocProvider.of<TransactionBloc>(context).add(
                      ChangeTransactionValue(
                        valor: value,
                      ),
                    );
                  },
                );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: KeyNumber(
                  number: "0",
                  onTap: (value) {
                    BlocProvider.of<TransactionBloc>(context).add(
                      ChangeTransactionValue(
                        valor: value,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onLongPress: () {
                    BlocProvider.of<TransactionBloc>(context).add(
                      ClearTransactionValue(),
                    );
                  },
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<TransactionBloc>(context).add(
                        RollbackTransaction(),
                      );
                    },
                    icon: const Icon(
                      Icons.backspace,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
