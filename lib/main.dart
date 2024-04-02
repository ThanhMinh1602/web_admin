import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/features/dashboard_admin/presentations/page/admin_dashboard_page.dart';
import 'package:web_admin/services/firebase_options.dart';

void main() async {
  _initialService();
  runApp(const MyApp());
}

Future<void> _initialService() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(colorSchemeSeed: AppColor.primaryColor),
          debugShowCheckedModeBanner: false,
          title: 'NIKE SHOE ADMIN',
          home: const AdminDashboardPage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
