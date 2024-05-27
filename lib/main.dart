import 'package:flutter/material.dart';
import 'package:projek_akhir/screens/home.dart';
import 'package:projek_akhir/screens/splash_screen.dart'; // Impor SplashScreen
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projek_akhir/models/reservation.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReservationAdapter());
  await Hive.openBox<Reservation>('reservationsBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
