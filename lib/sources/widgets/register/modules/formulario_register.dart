import 'package:dindin_app/library.dart';

class FormularioRegister extends StatefulWidget {
  const FormularioRegister({Key? key}) : super(key: key);

  @override
  State<FormularioRegister> createState() => _FormularioRegisterState();
}

class _FormularioRegisterState extends State<FormularioRegister> {
  final _keyRegister = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Form(
        key: _keyRegister,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screen.size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  "Crie sua conta",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 15,
              ),
              child: CustomTextForm(
                labelText: "Nome",
                controller: _nomeController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15,
              ),
              child: CustomTextForm(
                labelText: "E-mail",
                controller: _emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                isPassword: false,
                validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15,
              ),
              child: CustomTextForm(
                labelText: "Senha",
                controller: _senhaController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obscureChange: state.showPassword,
                onChangeObscure: () {
                  BlocProvider.of<RegisterBloc>(context).add(
                    RegisterShowPassword(showPassword: !state.showPassword),
                  );
                },
                validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15,
              ),
              child: CustomTextForm(
                labelText: "Confirme a Senha",
                controller: _senhaConfirmController,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obscureChange: state.showConfirmPassword,
                onChangeObscure: () {
                  BlocProvider.of<RegisterBloc>(context).add(
                    RegisterShowPassword(
                        showConfirmPassword: !state.showConfirmPassword),
                  );
                },
                validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
              ),
            ),
            SizedBox(
              width: screen.size.width * 0.8,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  final keyState = _keyRegister.currentState?.validate();
                  if (keyState != null && keyState) {
                    BlocProvider.of<RegisterBloc>(context).add(
                      RegisterNewUser(
                        email: _emailController.text,
                        name: _nomeController.text,
                        password: _senhaController.text,
                      ),
                    );
                  }
                },
                child: const Text("Cadastrar"),
              ),
            ),
          ],
        ),
      );
    });
  }
}
