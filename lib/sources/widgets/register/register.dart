import 'package:dindin_app/library.dart';
import 'package:dindin_app/sources/widgets/login/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    BlocProvider.of<RegisterBloc>(context).add(InitialRegister());
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
          appBar: AppBar(
            toolbarHeight: 80,
            leading: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 10,
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    Assets.assetsLogo,
                    width: screen.size.width * 0.35,
                  ),
                ),
                SizedBox(
                  height: screen.size.height * 0.8,
                  width: screen.size.width * 0.9,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) async {
                        if (state.statusRequest == RegisterEnum.alreadyExists) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return LoginDialog(
                                  message: state.requestMessage,
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        } else if (state.statusRequest ==
                            RegisterEnum.created) {
                          await Future.delayed(const Duration(
                            milliseconds: 500,
                          ));
                          if (!mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        switch (state.status) {
                          case RegisterStatus.idle:
                            return const FormularioRegister();
                          case RegisterStatus.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case RegisterStatus.success:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case RegisterStatus.invalid:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
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
