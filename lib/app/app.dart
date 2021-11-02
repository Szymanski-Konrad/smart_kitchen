import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_kitchen/app/global_blocs/blocs.dart';
import 'package:smart_kitchen/app/navigation/navigator.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GlobalBlocs.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.transparent;
                }
                return null;
              }),
            ),
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          primaryColor: ColorPalette.primary,
          accentColor: ColorPalette.accent,
          buttonColor: ColorPalette.buttons,
          primarySwatch: ColorPalette.primarySwatch,
          dividerColor: ColorPalette.accent,
          toggleableActiveColor: ColorPalette.accent,
          unselectedWidgetColor: Colors.white,
          canvasColor: ColorPalette.background,
          scaffoldBackgroundColor: ColorPalette.background,
          dialogBackgroundColor: ColorPalette.dialogs,
          buttonTheme: const ButtonThemeData(
            buttonColor: ColorPalette.buttons,
            disabledColor: ColorPalette.background,
          ),
          dialogTheme: const DialogTheme(
            contentTextStyle: TextStyle(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          textTheme: const TextTheme(
            headline1:
                TextStyle(color: Colors.white, fontSize: 24), // Scaffold title
            headline6: TextStyle(color: ColorPalette.text, fontSize: 16),
            subtitle1:
                TextStyle(color: ColorPalette.text, fontSize: 14), // TextField
            subtitle2:
                TextStyle(color: ColorPalette.text, fontSize: 12), // Subtitle
            bodyText1:
                TextStyle(color: ColorPalette.text, fontSize: 14), // TextWidget
            bodyText2:
                TextStyle(color: ColorPalette.text, fontSize: 14), // TextWidget
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.accent),
            ),
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: ColorPalette.background,
          iconTheme: const IconThemeData(color: ColorPalette.primary, size: 22),
          cardTheme: CardTheme(
            elevation: 8,
            color: ColorPalette.dialogs,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          appBarTheme: const AppBarTheme(
            color: ColorPalette.primary,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ColorPalette.background,
            elevation: 0,
            unselectedIconTheme:
                IconThemeData(color: ColorPalette.accent, size: 18),
            showSelectedLabels: true,
            selectedItemColor: ColorPalette.primary,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const PageNavigator(),
      ),
    );
  }
}
