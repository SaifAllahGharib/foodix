import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    }

    final status = await permission.request();
    return status.isGranted;
  }

  Future<Map<Permission, PermissionStatus>> requestPermissions(
      List<Permission> permissions) async {
    final statuses = await permissions.request();
    return statuses;
  }

  Future<bool> isPermissionGranted(Permission permission) async {
    return await permission.isGranted;
  }

  Future<bool> arePermissionsGranted(List<Permission> permissions) async {
    for (var permission in permissions) {
      if (!await permission.isGranted) {
        return false;
      }
    }
    return true;
  }

  Future<void> openAppSettings() async {
    await openAppSettings();
  }
}
