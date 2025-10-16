import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/main_menu_screen.dart';
import 'services/game_state_manager.dart';
import 'services/audio_manager.dart';
import 'services/save_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lock orientation to portrait for consistent experience
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  runApp(const SolGame());
}

class SolGame extends StatelessWidget {
  const SolGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameStateManager()),
        ChangeNotifierProvider(create: (_) => AudioManager()),
        ChangeNotifierProvider(create: (_) => SaveManager()),
      ],
      child: MaterialApp(
        title: 'Sol - Retro RPG',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // 8-bit retro theme with GB/GBA color palette
          primaryColor: const Color(0xFF306230), // GB green
          scaffoldBackgroundColor: const Color(0xFF0f380f),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF306230),
            secondary: Color(0xFF8bac0f),
            surface: Color(0xFF0f380f),
            background: Color(0xFF0f380f),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9bbc0f),
              fontFamily: 'monospace',
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color(0xFF9bbc0f),
              fontFamily: 'monospace',
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: Color(0xFF8bac0f),
              fontFamily: 'monospace',
            ),
          ),
          useMaterial3: true,
        ),
        home: const MainMenuScreen(),
      ),
    );
  }
}
