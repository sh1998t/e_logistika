import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/core/utils/formatters/formatters.dart';
import 'package:e_logistika/features/my_card/presentation/widgets/main_text_fielid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../gen/assets.gen.dart';
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
  FocusNode focusNode = FocusNode();
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
            Opacity(opacity: 0.6,

              child: Image.asset(
                'assets/images/background_image_login.png',
                fit: BoxFit.cover,
              ),

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
                            MainTextField(
                              controller: _loginController,
                              hintText: "+998 93 123 45 67",
                              inputFormatters: [Formatters.phoneNumber],
                              keyboardType: TextInputType.number,
                              prefix: Padding(
                                padding:  EdgeInsets.all(10.r),
                                child: Assets.svg.call.svg(width: 8.r, height: 8.r, fit: BoxFit.fill),
                              ),
                            ),



                      SizedBox(height: 12.h),
                            MainTextField(
                              hintText: "Пароль",
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              prefix: Padding(
                                padding:  EdgeInsets.all(10.r),
                                child: Assets.svg.lock.svg(width: 8.r, height: 8.r, fit: BoxFit.fill),
                              ),
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
                                  onPressed: (){
                                    context.pushNamed(RoutersName.registerPageName);
                                  },

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


          ],
        ),
      ),
    );
  }
}
