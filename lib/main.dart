import 'package:dindin_app/library.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeDB.registerAdapters();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<TransactionBloc>(
          create: (context) => TransactionBloc(),
        ),
      ],
      child: const DinDin(),
    ),
  );
}
