import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_kitchen/app/global_blocs/blocs.dart';
import 'package:smart_kitchen/app/navigation/navigator.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/dimensions.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
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
          scaffoldBackgroundColor: ColorPalette.lightBlue,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorPalette.lightBlack,
            elevation: 0,
          ),
          cardTheme: const CardTheme(
            color: ColorPalette.lightBlack,
            elevation: Dimensions.d4,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.d16),
                topRight: Radius.circular(Dimensions.d16),
              ),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 5,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: ColorPalette.green,
            unselectedIconTheme: IconThemeData(
              color: ColorPalette.grey,
              size: Dimensions.d16,
            ),
            selectedLabelStyle: TextStyle(fontSize: Dimensions.d16),
            selectedIconTheme: IconThemeData(
              color: ColorPalette.green,
              size: Dimensions.d24,
            ),
          ),
        ),
        // theme: ThemeData(
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ButtonStyle(
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(16),
        //         ),
        //       ),
        //       backgroundColor:
        //           MaterialStateProperty.resolveWith<Color?>((states) {
        //         if (states.contains(MaterialState.disabled)) {
        //           return Colors.transparent;
        //         }
        //         return null;
        //       }),
        //     ),
        //   ),
        //
        //   primaryColor: ColorPalette.space,
        //   accentColor: ColorPalette.darkCyan,
        //   buttonColor: ColorPalette.yellowRed,
        //   primarySwatch: ColorPalette.primarySwatch,
        //   dividerColor: ColorPalette.darkCyan,
        //   toggleableActiveColor: ColorPalette.yellowRed,
        //   unselectedWidgetColor: Colors.white,
        //   canvasColor: ColorPalette.sapphire,
        //   scaffoldBackgroundColor: ColorPalette.sapphire,
        //   dialogBackgroundColor: ColorPalette.grape,
        //   buttonTheme: const ButtonThemeData(
        //     buttonColor: ColorPalette.yellowRed,
        //     disabledColor: ColorPalette.sapphire,
        //   ),
        //   dialogTheme: const DialogTheme(
        //     contentTextStyle: TextStyle(color: Colors.black),
        //     titleTextStyle: TextStyle(
        //       color: Colors.deepOrange,
        //       fontWeight: FontWeight.bold,
        //       fontStyle: FontStyle.italic,
        //     ),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(20)),
        //     ),
        //   ),
        //   textTheme: const TextTheme(
        //     headline1:
        //         TextStyle(color: Colors.white, fontSize: 24), // Scaffold title
        //     headline6: TextStyle(color: ColorPalette.text, fontSize: 16),
        //     subtitle1:
        //         TextStyle(color: ColorPalette.text, fontSize: 14), // TextField
        //     subtitle2:
        //         TextStyle(color: ColorPalette.text, fontSize: 12), // Subtitle
        //     bodyText1:
        //         TextStyle(color: ColorPalette.text, fontSize: 14), // TextWidget
        //     bodyText2:
        //         TextStyle(color: ColorPalette.text, fontSize: 14), // TextWidget
        //   ),
        //   inputDecorationTheme: const InputDecorationTheme(
        //     focusedBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(color: ColorPalette.darkCyan),
        //     ),
        //     hintStyle: TextStyle(
        //       color: Colors.white,
        //       fontSize: 14,
        //       fontStyle: FontStyle.italic,
        //     ),
        //   ),
        //   backgroundColor: ColorPalette.sapphire,
        //   iconTheme: const IconThemeData(color: ColorPalette.space, size: 22),
        //   cardTheme: CardTheme(
        //     elevation: 8,
        //     color: ColorPalette.grape,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //   ),
        //   appBarTheme: const AppBarTheme(
        //     color: Colors.transparent,
        //     elevation: 0,
        //     iconTheme: IconThemeData(color: Colors.white),
        //     textTheme: TextTheme(
        //       headline6: TextStyle(color: Colors.white, fontSize: 22),
        //     ),
        //   ),
        //
        //
        // ),
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        // ],
        // supportedLocales: AppLocalizations.supportedLocales,
        home: const PageNavigator(),
      ),
    );
  }
}
