import 'package:flutter/material.dart';

/// Feature card: icon box + title + description (350 x 72)
class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconSize = 24,
    this.flipIcon = false, // Mirrors the icon horizontally
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final double iconSize;
  final bool flipIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 72,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000), // #000000 at 5%
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),

      // RTL: the icon sits on the right and the text starts from the right
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            // Icon box
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE6EEFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Transform.flip(
                flipX: flipIcon,
                child: Icon(
                  icon,
                  size: iconSize,
                  color: const Color(0xFF1A37FF),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Title and description
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: Color(0xFF01002F),
                      ),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: Color(0xFF737373),
                    ),
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
