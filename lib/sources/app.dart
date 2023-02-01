
import 'package:dindin_app/library.dart';

class DinDin extends StatelessWidget {
  const DinDin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      home: const SplashScreen(),
    );
  }
}