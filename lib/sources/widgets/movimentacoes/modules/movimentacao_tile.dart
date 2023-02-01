// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dindin_app/library.dart';

class MovimentacaoTile extends StatelessWidget {
  final String descricao;
  final String categoria;
  final String valor;
  final Color color;

  const MovimentacaoTile({
    Key? key,
    required this.descricao,
    required this.categoria,
    required this.valor,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
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
            Icons.circle,
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
