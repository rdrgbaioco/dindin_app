import 'package:dindin_app/library.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    final nameController = TextEditingController();

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
          'Seu Nome',
          style: theme.textTheme.titleLarge,
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
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 30,
            ),
            child: CustomTextForm(
              labelText: "Alterar Nome",
              controller: nameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  value == null || value == '' ? 'Campo obrigatório' : null,
            ),
          ),
          SizedBox(
            height: 60,
            width: screen.size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                print(nameController.text);
              },
              child: const Text("Mudar nome"),
            ),
          ),
        ],
      ),
    );
  }
}
