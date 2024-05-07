import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

snackbarSucess(context, String messege) {
  IconSnackBar.show(context,
      duration: const Duration(seconds: 2),
      snackBarType: SnackBarType.success,
      label: messege);
}

snackbarFail(context, String messege) {
  IconSnackBar.show(context,
      duration: const Duration(seconds: 2),
      snackBarType: SnackBarType.fail,
      label: messege);
}

snackbarAlert(context, String messege) {
  IconSnackBar.show(context,
      duration: const Duration(seconds: 2),
      snackBarType: SnackBarType.alert,
      label: messege);
}
