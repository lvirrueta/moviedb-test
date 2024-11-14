
import 'package:flutter/material.dart';

class LoadingService {
  void finishLoading(BuildContext context) {
    if (loadingDialogRoute != null ) {
      if (loadingDialogRoute!.isActive) {
        Navigator.of(context).removeRoute(loadingDialogRoute!);
      }
    }
  }

  DialogRoute ? loadingDialogRoute;

  void showLoading(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    loadingDialogRoute = DialogRoute(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
            child: CircularProgressIndicator(
            color: colors.secondary,
            strokeAlign: 10,
          ),
        ),
      ),
    );

    Navigator.of(context).push(loadingDialogRoute!);
  }
}
