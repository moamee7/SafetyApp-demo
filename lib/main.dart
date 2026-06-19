import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const YouthSafetyApp());
}

class YouthSafetyApp extends StatelessWidget {
  const YouthSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // STEP 2 will add: ChangeNotifierProvider(create: (_) => AuthProvider()),
        // STEP 4 will add: ChangeNotifierProvider(create: (_) => ContactProvider()),
      ],
      child: MaterialApp(
        title: 'Youth Safety',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
          useMaterial3: true,
        ),
        home: const _FirebaseReadyScreen(),
      ),
    );
  }
}

class _FirebaseReadyScreen extends StatelessWidget {
  const _FirebaseReadyScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.shield_outlined, size: 64, color: Colors.deepOrange),
            SizedBox(height: 16),
            Text(
              'Youth Safety',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Firebase initialized successfully ✅'),
          ],
        ),
      ),
    );
  }
}