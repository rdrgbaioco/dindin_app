import 'package:dindin_app/library.dart';

class ThemeApp {

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: DinDinColors.primary,
      brightness: Brightness.light,
      primary: DinDinColors.primary,
      onPrimary: DinDinColors.onPrimary,
      secondary: DinDinColors.secondary,
      onSecondary: DinDinColors.onSecondary,
      tertiary: DinDinColors.primary,
      error: DinDinColors.error,
      secondaryContainer: DinDinColors.secondaryGradient,
      inverseSurface: DinDinColors.fontGrey,
      inversePrimary: DinDinColors.fontBlack,
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      toolbarHeight: 60,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: DinDinColors.primary,
      iconTheme: IconThemeData(
        color: DinDinColors.onPrimary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: DinDinColors.onPrimary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DinDinColors.primary,
        foregroundColor: DinDinColors.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        fixedSize: const Size(200.0, 50.0),
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    textTheme: GoogleFonts.openSansTextTheme(textTheme),
  );

  static const textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: DinDinColors.onPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: DinDinColors.onPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: DinDinColors.onPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      wordSpacing: 0.0,
      //fontWeight: FontWeight.bold,
      color: DinDinColors.onPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      wordSpacing: 0.15,
      fontWeight: FontWeight.w700,
      color: DinDinColors.onPrimary,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      wordSpacing: 0.1,
      fontWeight: FontWeight.bold,
      color: DinDinColors.onPrimary,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      wordSpacing: 0.1,
      fontWeight: FontWeight.w700,
      color: DinDinColors.onPrimary,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      wordSpacing: 0.5,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w700,
      color: DinDinColors.onPrimary,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      wordSpacing: 0.5,
      fontWeight: FontWeight.w700,
      color: DinDinColors.onPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      wordSpacing: 0.15,
      fontWeight: FontWeight.normal,
      color: DinDinColors.onPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      wordSpacing: 0.25,
      fontWeight: FontWeight.normal,
      color: DinDinColors.onPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      wordSpacing: 0.4,
      fontWeight: FontWeight.normal,
      color: DinDinColors.fontGrey,
    ),
  );
}