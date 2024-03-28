import 'package:flutter/material.dart';
import 'package:football_next_gen/auth/auth_listener.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';
import 'package:football_next_gen/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KeycloakRepository().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouterManager routerManager = RouterManager();
  static const int primaryColor = 0xFF04163a;

  final MaterialColor primary =  const MaterialColor(primaryColor,
      <int, Color>{
        50: Color(0xFFEDE7F6),
        100: Color(0xFFD1C4E9),
        200: Color(0xFFB39DDB),
        300: Color(0xFF9575CD),
        400: Color(0xFF7E57C2),
        500: Color(primaryColor),
        600: Color(0xFF5E35B1),
        700: Color(0xFF512DA8),
        800: Color(0xFF4527A0),
        900: Color(0xFF311B92),
      });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthListener>(
            create: (_) => AuthListener()),
        Provider<RouterManager>(create: (_) => RouterManager()),
      ],

      child: Builder(
        builder: (context) {
          final GoRouter goRouter = Provider.of<RouterManager>(context, listen: false).goRouter;
          return materialApp(goRouter);
        },
      ),

    );
  }

  Widget materialApp(GoRouter goRouter){
    return MaterialApp.router(
    /*    localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: <Locale>[
          Locale('it', 'IT'),
          Locale('en', 'US'),
        ], */
        title: 'Football Next Gen',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: primary
        ),
        routerConfig: goRouter
    );
  }


}

