import 'package:biblioteca/views/add_book_page.dart';
import 'package:biblioteca/views/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

/* void main() {
  runApp(const MyApp());
}
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => const AddBookPage(),
      },
    );
  }
}
