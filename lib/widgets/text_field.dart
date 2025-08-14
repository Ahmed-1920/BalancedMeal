import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextStyle? hintStyle;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: controller,
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              hintText: 'Enter $label',
              hintStyle: hintStyle ??
                  GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF57636C),
                  ),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
