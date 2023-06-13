import 'package:flutter/material.dart';
import 'package:medical_consultation_app/di/injection.dart';
import 'package:medical_consultation_app/domain/api/mock_data.dart';
import 'package:medical_consultation_app/infrastructure/core/app_config.dart';
import 'package:medical_consultation_app/presentation/tab_bar/tab_bar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MockData.instance.bootStrap();
  AppConfig.setEnvironment(Environment.mock);
  await initAppModule();
  runApp(const MedicalConsultationApp());
}

class MedicalConsultationApp extends StatelessWidget {
  const MedicalConsultationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TabBarScreen(),
    );
  }
}
