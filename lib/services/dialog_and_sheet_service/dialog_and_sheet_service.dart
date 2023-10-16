import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_cyber/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:mobile_cyber/services/navigation/navigation_service.dart';



class DialogAndSheetService extends IDialogAndSheetService {
  final key = NavigationService.navigatorKey;
  @override
  Future<T?> showAppBottomSheet<T>(Widget child) async {
    return showModalBottomSheet(
      context: key.currentContext!,
      enableDrag: true,
      isScrollControlled: true,
      elevation: 0,
      isDismissible: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (context) => child,
    );
  }

  @override
  Future<T?> showAppDialog<T>(Widget child) async {
    return showDialog(
      context: key.currentContext!,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (context) => child,
    );
  }
}
