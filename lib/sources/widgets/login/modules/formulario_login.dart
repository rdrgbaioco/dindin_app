import 'package:dindin_app/library.dart';

class FormularioLogin extends StatefulWidget {
  const FormularioLogin({Key? key}) : super(key: key);

  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {

  final _keylogin = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: _keylogin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: screen.size.width * 0.8,
                child: CustomTextForm(
                  labelText: "Seu e-mail",
                  controller: _usuarioController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value == ''
                      ? 'Campo obrigatório'
                      : null,
                ),
              ),
              SizedBox(
                width: screen.size.width * 0.8,
                child: CustomTextForm(
                  labelText: "Senha",
                  controller: _senhaController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  obscureChange: state.showPassword,
                  onChangeObscure: () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginShowPassword(showPassword: !state.showPassword),
                    );
                  },
                  onFieldSubmitted: (value) {
                    _login();
                  },
                  validator: (value) => value == null || value == ''
                      ? 'Campo obrigatório'
                      : null,
                ),
              ),
              SizedBox(
                width: screen.size.width * 0.8,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text("Entrar"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Não possui conta?",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: Text(
                      "Clique aqui",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  void _login() {
    final keyState = _keylogin.currentState?.validate();
    if (keyState != null && keyState) {
      BlocProvider.of<LoginBloc>(context).add(
        GetToken(
          email: _usuarioController.text,
          senha: _senhaController.text,
        ),
      );
    }
  }

}