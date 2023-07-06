import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayWidget extends StatelessWidget {
  const SystemUiOverlayWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: theme.brightness.name == "dark" ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: theme.scaffoldBackgroundColor,
        ),
        child: child
    );
  }
}