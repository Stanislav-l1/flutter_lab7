import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_flutter/translations/locale_keys.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  void _changeLanguage(BuildContext context, Locale locale) {
    context.setLocale(locale);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.settings.tr(), style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            Text(LocaleKeys.choose_language.tr(), style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () => _changeLanguage(context, Locale('en', 'US')),
              child: Text('English'),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () => _changeLanguage(context, Locale('ru', 'RU')),
              child: Text('Русский'),
            ),
          ],
        ),
      ),
    );
  }
}