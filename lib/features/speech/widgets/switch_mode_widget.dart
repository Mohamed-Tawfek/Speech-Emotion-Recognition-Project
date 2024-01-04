
import 'package:flutter/material.dart';

class SwitchModeWidget extends StatefulWidget {
  SwitchModeWidget({
    super.key,
  });
  bool value = false;
  @override
  State<SwitchModeWidget> createState() => _SwitchModeWidgetState();
}

class _SwitchModeWidgetState extends State<SwitchModeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 65,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          value: widget.value,
          onChanged: (v) {
            setState(() {
              widget.value = !widget.value;
            });
          },
          activeColor: Colors.indigo,
          inactiveTrackColor: Colors.grey[400],
          activeThumbImage: const AssetImage('assets/icons/moon.png'),
          inactiveThumbImage: const AssetImage('assets/icons/sun.png'),
        ),
      ),
    );
  }
}
