import 'package:dindin_app/library.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Perfil',
          style: theme.textTheme.titleMedium,
        ),
        flexibleSpace: Container(
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
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsProfile,
                width: screen.size.width * 0.25,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Divider(
            height: 1.0,
            color: theme.colorScheme.inverseSurface,
          ),
          Container(
            height: 90,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Nome\n',
                    style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.inversePrimary,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Silas Ribeiro',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangeName(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 28,
                      ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            color: theme.colorScheme.inverseSurface,
          ),
          Container(
            height: 90,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Email\n',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.inversePrimary,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'silas@gmail.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 2.0,
            color: theme.colorScheme.inverseSurface,
          ),
          SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ),
                      );
                    },
                    child: const Text('Alterar a senha'),
                  ),
                ),
                Divider(
                  height: 2.0,
                  color: theme.colorScheme.inverseSurface,
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: const Text('Sair'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
