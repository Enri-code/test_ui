import 'package:flutter/material.dart';
import 'package:test_ui/global/presentation/theme/colors.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

abstract class ThemeSettings {
  static const routes = <String, Widget Function(BuildContext)>{};

  static final myTextTheme = Typography.blackRedmond.copyWith(
    bodyText1: TextStyles.body1,
    bodyText2: TextStyles.body2,
    button: TextStyles.body2,
  );

  static final theme = ThemeData.from(
    colorScheme: const ColorScheme.light(primary: ColorPalette.primary),
    textTheme: myTextTheme,
  ).copyWith(
    appBarTheme:
        const AppBarTheme(elevation: 0, toolbarHeight: 80, centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(300, 48),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    )),
inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 21),
    ),
  );
}
