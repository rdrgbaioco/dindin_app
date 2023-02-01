import 'package:dindin_app/library.dart';

class CustomListTile extends StatelessWidget {
  final String descricao;
  final String categoria;
  final String valor;
  final IconData icon;
  final Color color;
  const CustomListTile({
    Key? key,
    required this.descricao,
    required this.categoria,
    required this.valor,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 1,
          color: theme.colorScheme.inverseSurface,
        ),
      ),
      child: ListTile(
        title: Text(
          descricao,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.inversePrimary,
          ),
        ),
        subtitle: Text(
          categoria,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.inverseSurface,
          ),
        ),
        tileColor: theme.colorScheme.primary,
        leading: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        trailing: Text(
          valor,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w100,
            color: color,
          ),
        ),
      ),
    );
  }
}
