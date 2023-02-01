import 'package:dindin_app/library.dart';

import '../../movimentacoes/movimentacoes.dart';

class TopHome extends StatelessWidget {
  final String nome;
  final String saldo;

  const TopHome({
    Key? key,
    required this.nome,
    required this.saldo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 40,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      Assets.assetsProfile,
                      width: screen.size.width * 0.2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Olá\n',
                      style: theme.textTheme.bodyLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: nome,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Saldo\n',
                style: theme.textTheme.bodyLarge,
                children: <TextSpan>[
                  TextSpan(
                    text: saldo,
                    style: theme.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Movimentacoes(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sync_alt,
                    size: 35,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Text(
                    "Movimentações",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
