import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';

class EncryptionDisabledNotice extends StatelessWidget {
  const EncryptionDisabledNotice({Key? key}) : super(key: key);

  static void open(BuildContext context) {
    if (checkPlatformIsDesktop()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(t.dialogs.encryptionDisabledNotice.title),
          content: Text(t.dialogs.encryptionDisabledNotice.content),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(t.general.close),
            )
          ],
        ),
      );
    } else {
      context.pushBottomSheet(() => const EncryptionDisabledNotice());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: t.dialogs.encryptionDisabledNotice.title,
      description: t.dialogs.encryptionDisabledNotice.content,
      child: Center(
        child: ElevatedButton(
          onPressed: () => context.popUntilRoot(),
          child: Text(t.general.close),
        ),
      ),
    );
  }
}
