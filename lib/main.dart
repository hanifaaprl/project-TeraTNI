import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'onboarding.dart'; // Pastikan HalamanUtama diimpor dengan benar

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        home: HalamanUtama(), // Pastikan HalamanUtama adalah widget yang valid
      ),
      //debugShowFloatingThemeButton: true, // Menampilkan tombol untuk mengubah tema secara manual
    );
  }
}
