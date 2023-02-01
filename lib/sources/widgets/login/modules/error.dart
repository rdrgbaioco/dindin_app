import 'package:dindin_app/library.dart';
import 'package:dindin_app/sources/widgets/login/login.dart';

class LoginError extends StatelessWidget {
  const LoginError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return SizedBox(
      width: screen.size.width * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: theme.colorScheme.error,
            ),
            const SizedBox(height: 10),
            Text(
              "Aconteceu algum problema!",
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginToInitialState(),
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                        (route) => false,
                  );
                },
                child: Text(
                  "Tentar novamente",
                  style: theme.textTheme.titleMedium,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
