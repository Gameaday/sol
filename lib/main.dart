import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/main_menu_screen.dart';
import 'services/game_state_manager.dart';
import 'services/audio_manager.dart';
import 'services/save_manager.dart';
import 'services/theme_manager.dart';

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
        ChangeNotifierProvider(create: (_) => ThemeManager()),
      ],
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            title: 'Sol - Retro RPG',
            debugShowCheckedModeBanner: false,
            theme: themeManager.buildTheme(),
            home: const MainMenuScreen(),
          );
        },
      ),
    );
  }
}
