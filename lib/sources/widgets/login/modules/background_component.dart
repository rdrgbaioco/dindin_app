import 'package:dindin_app/library.dart';

class BackgroundComponent extends StatelessWidget {
  final Widget child;
  const BackgroundComponent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.assetsBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
