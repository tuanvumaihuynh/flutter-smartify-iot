import 'package:do_an_1_iot/providers/theme_provider.dart';
import 'package:do_an_1_iot/providers/data_provider.dart';
import 'package:do_an_1_iot/providers/weather_provider.dart';
import 'package:do_an_1_iot/utils/local_data_source.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  ///
  /// Device orientation
  ///
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  ///
  /// Initilize Firebase
  ///
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///
  /// runApp
  ///
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<DataProvider>(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
