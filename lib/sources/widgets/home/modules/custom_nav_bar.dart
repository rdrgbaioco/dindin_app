import 'package:dindin_app/library.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Container(
      color: theme.colorScheme.onPrimary,
      alignment: Alignment.bottomCenter,
      height: 80,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screen.size.width * 0.7,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          ChangePageIndex(index: 0),
                        );
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 1,
                          ),
                          color: state.index == 0
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Icon(
                          Icons.home_rounded,
                          size: 35,
                          color: state.index == 0
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          constraints: BoxConstraints(
                            maxHeight: screen.size.height * 0.90,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return const RegisterTransaction();
                            },
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 35,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          ChangePageIndex(index: 1),
                        );
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 1,
                          ),
                          color: state.index == 1
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Icon(
                          Icons.insights_rounded,
                          size: 35,
                          color: state.index == 1
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
