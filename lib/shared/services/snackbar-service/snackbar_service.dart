import 'package:flutter/material.dart';

class SnackbarService {
  SnackbarService({
    required this.context,
    required this.textContent,
  });

  final BuildContext context;
  final duration = 5;
  final String textContent;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar() {
    ScaffoldMessenger.of(context).clearSnackBars();

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textContent),
        duration: Duration(seconds: duration),
      )
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(String code) {
    ScaffoldMessenger.of(context).clearSnackBars();

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textContent, style: const TextStyle(color: Colors.white) ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Error: $code', 
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 88, 1, 1),
        duration: Duration(seconds: duration),
      )
    );
  }
}
