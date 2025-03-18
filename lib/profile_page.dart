import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_flutter/translations/locale_keys.g.dart';

class ProfilePage extends StatelessWidget {
  final String? name;
  final String? email;
  final String? phone;
  const ProfilePage({Key? key, this.name, this.email, this.phone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: name != null && email != null && phone != null
          ? Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.full_name.tr() + ': $name', style: TextStyle(fontSize: 20.sp)),
                  SizedBox(height: 10.h),
                  Text(LocaleKeys.email.tr() + ': $email', style: TextStyle(fontSize: 20.sp)),
                  SizedBox(height: 10.h),
                  Text(LocaleKeys.phone_number.tr() + ': $phone', style: TextStyle(fontSize: 20.sp)),
                ],
              ),
            )
          : Text(LocaleKeys.no_user.tr(), style: TextStyle(fontSize: 18.sp)),
    );
  }
}