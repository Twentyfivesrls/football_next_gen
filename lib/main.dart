import 'package:flutter/material.dart';
import 'package:football_next_gen/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouterManager routerManager = RouterManager();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
        title: 'Football Next Gen',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
        ),
        routerConfig: routerManager.goRouter
    );
  }


}

