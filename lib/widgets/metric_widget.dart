import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetricWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String unit;
  final TextStyle? hintStyle;

  const MetricWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.unit,
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
          child: Row(
            children: [
              Expanded(
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
              Text(
                unit.toUpperCase(), // Capitalize unit
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
