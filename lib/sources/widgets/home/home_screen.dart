import 'package:dindin_app/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int state = 0;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeInitialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return FadeIndexedStack(
              index: state.index,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    TopHome(
                      nome: state.nome,
                      saldo: state.saldo,
                    ),
                    const BottomHome(),
                  ],
                ),
                const Graphics(),
              ],
            );
          }
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
