import 'package:flutter/material.dart';

class SpeechCustomBtn extends StatelessWidget {
  const SpeechCustomBtn({super.key, required this.onTap, required this.child});
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            // gradient: const LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color(0xffef6171),
            //     Color(0xffad3b89),
            //     Color(0xff24a0d6),
            //   ],
            //   stops: [.1, 0.4, 1.5],
            // ),
            color: const Color(0xffCA4B7F),

          ),
          child: child,
        ),
      ),
    );
  }
}
