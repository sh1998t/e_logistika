import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/phone_input_field.dart';

class LoginPage extends StatefulWidget {
  static String name = 'login_page';
  static String path = '/login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background_image_login.png',
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
               color: Color(0xFF4C6994).withValues(alpha: 0.6),
              ),
            ),

            // 3️⃣ Login form (markazda kartochka)
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Container(
                 decoration: BoxDecoration(
                 color:  Colors.white.withValues(alpha: 0.7),

                   borderRadius: BorderRadius.circular(25.r)
                 ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 107,
                                    width: 277,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColor.strongBlue,
                                    ),
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/truck.svg',
                                          fit: BoxFit.cover,
                                        ),
                                        Center(
                                          child: SvgPicture.asset(
                                            'assets/svg/logo_login.svg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Вход в Е-логистика',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            PhoneInputField(),
                            const SizedBox(height: 12),
                            CustomTextField(
                              controller: _passwordController,
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: 15.w),
                                child: SvgPicture.asset('assets/svg/lock.svg',fit: BoxFit.cover,),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Parol kiriting';
                                }
                                if (value.length <
                                    AppConstants.minPasswordLength) {
                                  return 'Parol kamida ${AppConstants.minPasswordLength} ta belgidan iborat bo‘lsin';
                                }
                                return null;
                              },
                              inputType: TextInputType.text,
                              hintText: ' Пароль',
                            ),
                            SizedBox(height: 12.h),

                            AppButton(
                              height: 39.h,
                              backgroundColor: Color(0xFF0E3C74),
                              borderRadius: BorderRadius.circular(37),
                              title: 'Продолжить',
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                }
                              },
                            ),

                            const SizedBox(height: 16),

                            // Ro‘yxatdan o‘tish matni
                            Column(
                              children: [
                                Text(
                                  'Нажимая кнопку “продолжить”, вы принимаете условия Пользователское соглашения',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey[600]),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    '/register',
                                  ),
                                  child:  Text('Регистрация ',
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                   color: AppColor.strongBlue
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 4️⃣ Pastdagi yozuv
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: Column(
                children: [
                  Text(
                    'Developed by Digital Project Center 2024',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white70),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                    onPressed: () {
                      // TODO: til almashtirish funksiyasi
                    },
                    icon: const Icon(Icons.language),
                    label: const Text('O\'z • Ru'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
