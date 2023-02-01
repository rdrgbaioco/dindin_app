import 'package:dindin_app/library.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final checkPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);

    return UnfocusPage(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Alterar Senha',
            style: theme.textTheme.titleSmall,
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
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: theme.colorScheme.onPrimary,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextForm(
                    labelText: "Senha Atual",
                    controller: oldPassword,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    labelText: "Senha Nova",
                    controller: newPassword,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    labelText: "Confirmar Senha",
                    controller: checkPassword,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                    value == null || value == '' ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 60,
                    width: screen.size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Mudar senha"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
