import 'package:flutter/material.dart';

class PasswordStrengthBar extends StatelessWidget {
  const PasswordStrengthBar({super.key, required this.password});

  final String password;

  // Empty state colors
  static const Color _emptyBox = Color(0xFFFFE9E6);
  static const Color _emptyBar = Color(0xFFFE574F);

  /// Number of satisfied rules (0 to 3)
  int get _score {
    var score = 0;
    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password)) {
      score++;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]').hasMatch(password)) score++;
    return score;
  }

  String get _text {
    switch (_score) {
      case 1:
        return 'ضعيفة';
      case 2:
        return 'متوسطة';
      case 3:
        return 'قوية ومثالية';
      default:
        return 'أدخل كلمة المرور';
    }
  }

  Color get _color {
    switch (_score) {
      case 1:
        return const Color(0xFFE53935);
      case 2:
        return const Color(0xFFFB8C00);
      case 3:
        return const Color(0xFF22A06B);
      default:
        return _emptyBar;
    }
  }

  @override
  Widget build(BuildContext context) {
    final score = _score;
    final isEmpty = score == 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isEmpty ? _emptyBox : const Color(0xFFF4F7FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'قوة كلمة المرور',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    color: Color(0xFF737373),
                  ),
                ),
                if (!isEmpty)
                  Text(
                    _text,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: _color,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              children: List.generate(3, (i) {
                final active = i < score;
                return Expanded(
                  child: Container(
                    height: 6,
                    margin: EdgeInsetsDirectional.only(start: i == 0 ? 0 : 6),
                    decoration: BoxDecoration(
                      color: isEmpty
                          ? const Color(0xFFFFB4AB)
                          : (active ? _color : const Color(0xFFD0DFFF)),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
