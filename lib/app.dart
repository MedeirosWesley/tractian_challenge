import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tractian_challenge/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
            primary: const Color(0xFF17192D),
            secondary: const Color(0xFF2188FF),
            seedColor: const Color(0xFF17192D)),
        useMaterial3: true,
      ),
      routerDelegate: Routers.routes.routerDelegate,
      routeInformationParser: Routers.routes.routeInformationParser,
      routeInformationProvider: Routers.routes.routeInformationProvider,
    );
  }
}
