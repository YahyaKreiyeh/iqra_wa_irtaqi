import 'package:flutter/material.dart';

extension DialogExtensions on BuildContext {
  Future<T?> showCustomDialog<T>({
    Widget? title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlertDialog(
        title: title,
        content: content,
        actions:
            actions ??
            [
              TextButton(
                onPressed: () => Navigator.of(this).pop(),
                child: const Text('OK'),
              ),
            ],
      ),
    );
  }

  Future<bool> showConfirmationDialog({
    required String title,
    required String content,
    String confirmText = 'Yes',
    String cancelText = 'No',
    bool barrierDismissible = false,
  }) async {
    final result = await showDialog<bool>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(this).pop(false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.of(this).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<void> showErrorDialog({
    String? title,
    required String content,
    String buttonText = 'OK',
    bool barrierDismissible = true,
  }) {
    return showDialog<void>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlertDialog(
        title: title != null
            ? Text(
                title,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            : null,
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(this).pop(),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
