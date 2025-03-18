import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';
import 'package:lab_flutter/translations/locale_keys.g.dart';

class RegistrationPage extends StatefulWidget {
  final Function(String, String, String) onSubmit;
  const RegistrationPage({Key? key, required this.onSubmit}) : super(key: key);
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hidePass = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_nameController.text, _emailController.text, _phoneController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleKeys.registration_success.tr())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppStyles.padding.w),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: LocaleKeys.full_name.tr() + ' *',
                hintText: LocaleKeys.full_name_hint.tr(),
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                  onPressed: () => _nameController.clear(),
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius.r),
                ),
              ),
              validator: (value) => (value == null || value.isEmpty) ? LocaleKeys.name_error.tr() : null,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: LocaleKeys.phone_number.tr() + ' *',
                hintText: LocaleKeys.phone_hint.tr(),
                helperText: LocaleKeys.phone_helper.tr(),
                prefixIcon: Icon(Icons.call),
                suffixIcon: IconButton(
                  onPressed: () => _phoneController.clear(),
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius.r),
                ),
              ),
              validator: (value) => (value == null || value.isEmpty) ? LocaleKeys.phone_error.tr() : null,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: LocaleKeys.email.tr() + ' *',
                hintText: LocaleKeys.email_hint.tr(),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius.r),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return LocaleKeys.email_error.tr();
                if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) return LocaleKeys.email_invalid.tr();
                return null;
              },
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: _passwordController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.password.tr() + ' *',
                hintText: LocaleKeys.password_hint.tr(),
                prefixIcon: Icon(Icons.security),
                suffixIcon: IconButton(
                  icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _hidePass = !_hidePass),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius.r),
                ),
              ),
              validator: (value) => (value == null || value.length < 6) ? LocaleKeys.password_error.tr() : null,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.confirm_password.tr() + ' *',
                hintText: LocaleKeys.confirm_password_hint.tr(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _hidePass = !_hidePass),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius.r),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return LocaleKeys.confirm_password_error.tr();
                if (value != _passwordController.text) return LocaleKeys.passwords_not_match.tr();
                return null;
              },
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
              child: Text(LocaleKeys.submit.tr(), style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}