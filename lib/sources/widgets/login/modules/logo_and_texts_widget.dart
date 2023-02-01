import 'package:dindin_app/library.dart';

class LogoAndTexts extends StatelessWidget {
  const LogoAndTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Column(
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
              style: theme.textTheme.headlineLarge,
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
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
