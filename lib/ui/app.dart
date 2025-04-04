import 'package:app/constants/constants.dart';
import 'package:app/router.dart';
import 'package:app/ui/screens/screens.dart';
import 'package:app/ui/theme_data.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Material(
      color: Colors.transparent,
      child: GradientDecoratedContainer(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: themeData(context),
          initialRoute: InitialScreen.routeName,
          routes: AppRouter.routes,
        ),
      ),
    );
  }
}
