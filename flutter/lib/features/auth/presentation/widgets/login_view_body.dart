import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import 'login_header.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_routes.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LoginHeader(),

          // Form card (Figma: 347 wide, radius 12, two soft shadows)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Phone or email
                  const AppTextField(
                    label: 'رقم الهاتف أو البريد الإلكتروني',
                    hint: 'name@example.com أو 01X XXXX XXXX',
                    isRequired: true,
                    suffixIcon: Icon(
                      Icons.alternate_email,
                      size: 20,
                      color: Color(0xFF737373),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Password
                  const _PasswordField(),

                  const SizedBox(height: 8),

                  // Forgot password (aligned to the right in RTL)
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: GestureDetector(
                        onTap: () => context.push(AppRoutes.forgotPassword),
                        child: const Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            color: Color(0xFF1A37FF),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Login button
                  PrimaryButton(
                    label: 'تسجيل الدخول',
                    icon: Icons.login,
                    onPressed: () {
                      // TODO: login
                    },
                  ),

                  const SizedBox(height: 16),

                  // "Or login with" divider
                  const _OrDivider(),

                  const SizedBox(height: 16),

                  // Google + Apple side by side
                  Row(
                    children: [
                      Expanded(
                        child: _SocialButton(
                          label: 'Google',
                          icon: Image.asset(
                            'assets/images/Auth/google.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _SocialButton(
                          label: 'Apple',
                          icon: Icon(
                            Icons.apple,
                            size: 22,
                            color: Color(0xFF272727),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const _SignUpPrompt(),

          const SizedBox(height: 20), // Figma: 20

          const _TermsNote(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Password field with a lock icon (right) and a show/hide toggle (left)
class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'كلمة المرور',
      hint: '••••••••',
      isRequired: true,
      obscureText: _obscure,
      suffixIcon: const Icon(
        Icons.lock_outline,
        size: 20,
        color: Color(0xFF737373),
      ),
      prefixIcon: GestureDetector(
        onTap: () => setState(() => _obscure = !_obscure),
        child: Icon(
          _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          size: 20,
          color: const Color(0xFF737373),
        ),
      ),
    );
  }
}

/// Divider with a centered label
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(height: 1, thickness: 1, color: Color(0xFFD0DFFF)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'أو الدخول عبر',
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Color(0xFF737373),
            ),
          ),
        ),
        Expanded(
          child: Divider(height: 1, thickness: 1, color: Color(0xFFD0DFFF)),
        ),
      ],
    );
  }
}

/// Social login button
class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, required this.icon});

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.0,
              color: Color(0xFF272727),
            ),
          ),
          const SizedBox(width: 8),
          icon,
        ],
      ),
    );
  }
}

/// "Don't have an account? Create new account" row
class _SignUpPrompt extends StatelessWidget {
  const _SignUpPrompt();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => context.push(AppRoutes.signUp),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ليس لديك حساب؟',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.0,
                color: Color(0xFF737373),
              ),
            ),
            SizedBox(width: 4),
            Text(
              'إنشاء حساب جديد',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: Color(0xFFFE574F),
              ),
            ),
            SizedBox(width: 2),
            Icon(Icons.chevron_left, size: 16, color: Color(0xFFFE574F)),
          ],
        ),
      ),
    );
  }
}

/// Terms and privacy note under the sign-up row
class _TermsNote extends StatelessWidget {
  const _TermsNote();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 45),
      child: Text(
        'بالتسجيل أنت توافق على شروط الخدمة وسياسة الخصوصية الخاصة بنيفو',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: Color(0xFF737373),
        ),
      ),
    );
  }
}
