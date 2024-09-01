import 'package:flutter/material.dart';
import 'package:task/utils/screen_utils.dart';

class ResponsiveBuilders extends StatelessWidget {
  const ResponsiveBuilders(
      {super.key, required this.mobile, required this.desktop, this.tablet});

  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    DeviceType deviceType = ScreenUtils.getDeviceType(size.width);
    if (deviceType == DeviceType.mobile) {
      return mobile;
    } else if (deviceType == DeviceType.tablet) {
      return tablet ?? mobile;
    }

    return desktop;
  }
}
