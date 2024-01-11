import 'package:flutter/cupertino.dart';

class AppCustomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  const AppCustomButton({super.key, required this.text, required this.onTap, required this.width});

  @override
  State<AppCustomButton> createState() => _AppCustomButtonState();
}

class _AppCustomButtonState extends State<AppCustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          color: const Color(0xff1f41bb),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 16,
                color: Color(0xffffffff),
                fontFamily: 'Poppins-SemiBold',
                fontWeight: FontWeight.normal
            ),
            maxLines: 9999,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
