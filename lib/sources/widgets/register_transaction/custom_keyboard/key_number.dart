import 'package:dindin_app/library.dart';

class KeyNumber extends StatelessWidget {
  final void Function(String value) onTap;
  final String number;
  const KeyNumber({
    Key? key,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        onTap.call(number);
      },
      child: Container(
        width: 210,
        height: 70,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: theme.colorScheme.onPrimary,
          border: Border.all(
            color: theme.colorScheme.inverseSurface,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            number,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
