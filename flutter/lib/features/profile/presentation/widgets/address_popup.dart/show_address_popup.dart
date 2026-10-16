import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_popup.dart/address_popup.dart';

Future<void> showAddressPopup(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'إغلاق',
    barrierColor: Colors.black.withOpacity(0.2),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) => const SizedBox.shrink(),
    transitionBuilder: (context, anim, _, __) {
      final blur = 6.0 * Curves.easeOut.transform(anim.value);
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: FadeTransition(
          opacity: anim,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Material(
              type: MaterialType.transparency,
              child: Center(child: Directionality(
                textDirection: TextDirection.rtl,
                child: AddressPopup())),
            ),
          ),
        ),
      );
    },
  );
}