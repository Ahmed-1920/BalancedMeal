import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final Function(String?) onChanged;
  final TextStyle? hintStyle;

  const GenderDropdown({
    super.key,
    required this.selectedGender,
    required this.onChanged,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultHintStyle = hintStyle ??
        GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF57636C),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
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
          child: DropdownButtonFormField<String>(
            value: selectedGender,
            isExpanded: true,
            hint: Text('Select Gender', style: defaultHintStyle),
            dropdownColor: Colors.white,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            items: ['Male', 'Female']
                .map((gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender, style: GoogleFonts.poppins(fontSize: 14)),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
