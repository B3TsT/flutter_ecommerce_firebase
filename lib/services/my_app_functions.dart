import 'package:flutter/material.dart';

import '../widgets/subtitle_text.dart';
import 'assets_manager.dart';

class MyAppFunctions {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required Function fct,
    required String subTitle,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isError ? AssetsManager.error : AssetsManager.warning,
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 16.0),
              SubtitleTextWidget(
                label: subTitle,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const SubtitleTextWidget(
                        label: 'Cancel',
                        color: Colors.green,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const SubtitleTextWidget(
                      label: 'Ok',
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
