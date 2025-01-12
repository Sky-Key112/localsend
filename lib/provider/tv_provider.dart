import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/util/platform_check.dart';

final tvProvider = Provider<bool>((_) => throw Exception('tvProvider not initialized'));

/// Returns true, if this device is a TV.
/// Currently, only supports Android TV.
Future<bool> checkIfTv() async {
  if (checkPlatform([TargetPlatform.android])) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.systemFeatures.contains('android.software.leanback_only');
  } else {
    return false;
  }
}
