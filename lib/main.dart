import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_flutter/translations/locale_keys.g.dart';
 import 'registration_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: Builder(
  builder: (context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    locale: context.locale,
    supportedLocales: context.supportedLocales,
    localizationsDelegates: context.localizationDelegates,
    home: MyHomePage(),
  ),
),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String? _name;
  String? _email;
  String? _phone;

  void _onRegistrationComplete(String name, String email, String phone) {
    setState(() {
      _name = name;
      _email = email;
      _phone = phone;
      _currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.app_title.tr()),
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              RegistrationPage(onSubmit: _onRegistrationComplete),
              ProfilePage(name: _name, email: _email, phone: _phone),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.app_registration),
                label: LocaleKeys.register.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: LocaleKeys.profile.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: LocaleKeys.settings.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}