import 'package:arna/arna.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translate/providers.dart';

import '/strings.dart';
import '/utils/system_overlay.dart';
import 'screens/home.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    updateSystemUIOverlayStyle(context);
    final Brightness? themeMode = ref.watch(themeProvider);
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/AppIcon.png',
        height: Styles.base * 30,
        width: Styles.base * 30,
      ),
      title: Text(
        Strings.appName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: themeMode != null
              ? themeMode == Brightness.dark
                  ? ArnaColors.shade147
                  : ArnaColors.shade00
              : MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? ArnaColors.shade147
                  : ArnaColors.shade00,
        ),
      ),
      backgroundColor: themeMode != null
          ? themeMode == Brightness.dark
              ? ArnaColors.reverseBackgroundColor
              : ArnaColors.backgroundColor
          : MediaQuery.of(context).platformBrightness == Brightness.dark
              ? ArnaColors.reverseBackgroundColor
              : ArnaColors.backgroundColor,
      loadingText: Text(
        'Getting Started...',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: themeMode != null
              ? themeMode == Brightness.dark
                  ? ArnaColors.shade147
                  : ArnaColors.shade00
              : MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? ArnaColors.shade147
                  : ArnaColors.shade00,
        ),
      ),
      loaderColor: themeMode != null
          ? themeMode == Brightness.dark
              ? ArnaColors.shade154
              : ArnaColors.shade00
          : MediaQuery.of(context).platformBrightness == Brightness.dark
              ? ArnaColors.shade154
              : ArnaColors.shade00,
      navigator: const Home(),
      durationInSeconds: 2,
    );
  }
}
