import 'package:flutter/material.dart';
import 'package:home_assignment_app/widgets/main_screen.dart';
import 'package:home_assignment_app/widgets/notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Notifications().init();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
    )
  );
}

