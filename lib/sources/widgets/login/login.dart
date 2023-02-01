import 'package:dindin_app/library.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    final state = BlocProvider.of<LoginBloc>(context).state;
    if (state.loginStatus == LoginEnum.idle) {
      BlocProvider.of<LoginBloc>(context).add(
        LoginInitialize(),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return UnfocusPage(
      child: BackgroundComponent(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    Assets.assetsLogo,
                    width: screen.size.width * 0.4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Controle suas ',
                      style: theme.textTheme.headlineMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'finanças',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: ', sem planilha chata.',
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Organizar as suas finanças nunca foi tão fácil, como o DINDIN, você tem tudo num único lugar e em um clique de distância.',
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(
                  height: screen.size.height * 0.65,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listenWhen: (previous, current) =>
                      previous.authStatus != current.authStatus,
                      listener: (context, state) {
                        if (state.authStatus == AuthEnum.authenticated) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                                (route) => false,
                          );
                        } else if (state.authStatus == AuthEnum.invalid) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return LoginDialog(
                                  message: "E-mail ou senha inválidos, tente novamente.",
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                          );
                        }
                      },
                      builder: (context, state) {
                        switch (state.loginStatus) {
                          case LoginEnum.idle:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case LoginEnum.loading:
                            return SizedBox(
                              width: screen.size.width * 0.8,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          case LoginEnum.authenticated:
                            return SizedBox(
                              width: screen.size.width * 0.8,
                              child: Center(
                                child: Text(
                                  'Autenticado',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          case LoginEnum.unauthenticated:
                            return const FormularioLogin();
                          case LoginEnum.error:
                            return const LoginError();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
