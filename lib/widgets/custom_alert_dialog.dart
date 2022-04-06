import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final String text;
  final double textSize;
  const CustomAlertDialog({
    Key? key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  fontSize: textSize,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 16, 6, 102),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.done),
                label: const Text("OKAY"),
              )
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
