import 'package:dindin_app/library.dart';
import 'package:dindin_app/sources/widgets/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0.0);

  void timerValue() async {
    final stream = Stream.periodic(const Duration(milliseconds: 100), (count) => count++).take(100);
    stream.forEach((value) {
      if (value == 20) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ), (route) => false,
        );
      } else {
        _valueNotifier.value++;
      }
    });
  }

  @override
  void initState() {
    timerValue();
    super.initState();
  }

  @override
  void dispose() {
   // _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsLogo,
                width: screen.size.width * 0.6,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 40,
                  left: screen.size.width * 0.3,
                  right: screen.size.width * 0.3,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: const LinearProgressIndicator(
                    minHeight: 8,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
