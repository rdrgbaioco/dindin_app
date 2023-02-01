import 'package:dindin_app/library.dart';

class UnfocusPage extends StatelessWidget {
  final Widget child;
  const UnfocusPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return GestureDetector(
      onTap: () => focus.unfocus(),
      child: child,
    );
  }
}
