import 'package:dindin_app/library.dart';

class LoginDialog extends StatelessWidget {
  final String message;
  final void Function() onClick;
  const LoginDialog({
    Key? key,
    required this.message,
    required this.onClick,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.close,
              size: 40,
              color: theme.colorScheme.error,
            ),
            Text(
              message,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
      alignment: Alignment.center,
      actions:  [
        Center(
          child: ElevatedButton(
              onPressed: onClick,
              child: const Text("Ok")
          ),
        ),
      ],
    );
  }
}
