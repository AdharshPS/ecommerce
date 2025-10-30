import 'package:ecommerce/screens/splach/splach_screen.dart';
import 'package:ecommerce/service/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kfssrqgjoblxrintbqry.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtmc3NycWdqb2JseHJpbnRicXJ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE3MjYzNjYsImV4cCI6MjA3NzMwMjM2Nn0.V-3edOTNpFiqq0K9HCW22eqRKixQj-V7nsdrTLkPmwc',
  );
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
