import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pd_scan/screens/login_screen/login_ui.dart';
import 'package:pd_scan/screens/login_screen/login_view_model.dart';
import 'package:pd_scan/screens/scan_screen/scan_view_model.dart';
import 'package:pd_scan/utilities/themes/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<ScanScreenViewModel>(
            create: (_) => ScanScreenViewModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: QAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        title: 'Flutter Demo',
        theme: QAppTheme.lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
