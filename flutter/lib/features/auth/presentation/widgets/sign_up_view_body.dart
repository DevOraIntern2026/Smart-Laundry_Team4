import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_laundry/features/auth/presentation/widgets/sign_up_banner.dart';
import 'package:smart_laundry/features/auth/presentation/widgets/sign_up_header.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import 'password_strength_bar.dart';
import 'phone_field.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // Current password, used by the strength bar
  String _password = '';

  // Terms checkbox state
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SignUpHeader(),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.5),
            child: Column(
              children: [
                const SignUpBanner(),

                const SizedBox(height: 16),

                // Full name
                const AppTextField(
                  label: AppStrings.fullName,
                  hint: AppStrings.fullNameHint,
                  trailingLabel: AppStrings.requiredLabel,
                  height: 41,
                  suffixIcon: Icon(
                    Icons.person_outline,
                    size: 20,
                    color: AppColors.iconGrey,
                  ),
                ),

                const SizedBox(height: 16),

                // Phone
                const PhoneField(),

                const SizedBox(height: 12),

                // Email (optional)
                const AppTextField(
                  label: AppStrings.email,
                  hint: AppStrings.emailHint,
                  trailingLabel: AppStrings.optionalForInvoices,
                  height: 41,
                  isWhite: true,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icon(
                    Icons.mail_outline,
                    size: 20,
                    color: AppColors.gray,
                  ),
                ),

                const SizedBox(height: 12),

                // Password
                _SignUpPasswordField(
                  label: AppStrings.password,
                  onChanged: (value) => setState(() => _password = value),
                ),

                const SizedBox(height: 8),

                // Password strength bar
                PasswordStrengthBar(password: _password),

                const SizedBox(height: 12),

                // Confirm password (shield icon on the right)
                const _SignUpPasswordField(
                  label: AppStrings.confirmPassword,
                  leadingIcon: Icons.shield_outlined,
                ),

                const SizedBox(height: 16),

                // Terms checkbox
                _TermsCheckbox(
                  value: _accepted,
                  onChanged: (v) => setState(() => _accepted = v),
                ),

                const SizedBox(height: 16),

                // Create account button
                PrimaryButton(
                  label: AppStrings.createAccountContinue,
                  icon: Icons.arrow_back,
                  onPressed: _accepted
                      ? () {
                          // TODO: create account
                        }
                      : null,
                ),

                const SizedBox(height: 8),

                const _SecureNote(),
              ],
            ),
          ),

          const SizedBox(height: 32),

          const _LoginLink(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Password field with a lock icon (right) and a show/hide toggle (left)
class _SignUpPasswordField extends StatefulWidget {
  const _SignUpPasswordField({
    required this.label,
    this.leadingIcon,
    this.onChanged,
  });

  final String label;

  /// Icon on the right (lock for password, shield for confirm password)
  final IconData? leadingIcon;

  /// Called on every change (used by the strength bar)
  final ValueChanged<String>? onChanged;

  @override
  State<_SignUpPasswordField> createState() => _SignUpPasswordFieldState();
}

class _SignUpPasswordFieldState extends State<_SignUpPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: widget.label,
      hint: AppStrings.passwordHint,
      height: 41,
      isWhite: true,
      obscureText: _obscure,
      onChanged: widget.onChanged,
      suffixIcon: Icon(
        widget.leadingIcon ?? Icons.lock_outline,
        size: 20,
        color: AppColors.gray,
      ),
      prefixIcon: GestureDetector(
        onTap: () => setState(() => _obscure = !_obscure),
        child: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20,
          color: AppColors.gray,
        ),
      ),
    );
  }
}

class _TermsCheckbox extends StatelessWidget {
  const _TermsCheckbox({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    const base = TextStyle(
      fontFamily: AppTextStyle.fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.0,
      color: AppColors.black,
    );
    const link = TextStyle(
      fontFamily: AppTextStyle.fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.0,
      color: AppColors.secondaryColor,
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => onChanged(!value),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: value ? AppColors.primaryColor : AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.softBorderBlue),
                ),
                child: value
                    ? const Icon(Icons.check, size: 14, color: AppColors.white)
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: AppStrings.iAgreeTo, style: base),
                  TextSpan(text: AppStrings.termsAndConditions, style: link),
                  TextSpan(text: AppStrings.andWord, style: base),
                  TextSpan(text: AppStrings.privacyPolicy, style: link),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecureNote extends StatelessWidget {
  const _SecureNote();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontFamily: AppTextStyle.fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.0,
      color: AppColors.gray,
    );

    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.verified, size: 14, color: AppColors.emerald),
          SizedBox(width: 4),
          Text(AppStrings.dataEncrypted, style: style),
          SizedBox(width: 8),
          CircleAvatar(radius: 2, backgroundColor: AppColors.softBorderBlue),
          SizedBox(width: 8),
          Icon(Icons.bolt, size: 14, color: AppColors.secondaryColor),
          SizedBox(width: 4),
          Text(AppStrings.instantActivation, style: style),
        ],
      ),
    );
  }
}

class _LoginLink extends StatelessWidget {
  const _LoginLink();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => context.pop(),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.alreadyHaveAccount,
              style: TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.0,
                color: AppColors.gray,
              ),
            ),
            SizedBox(width: 4),
            Text(
              AppStrings.login,
              style: TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
