import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/metric_widget.dart';
import '../../widgets/text_field.dart';
import '../../widgets/gender_dropdown.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  String? selectedGender;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  bool get isButtonEnabled {
    return selectedGender != null &&
        weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        ageController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    weightController.addListener(() => setState(() {}));
    heightController.addListener(() => setState(() {}));
    ageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Enter your details',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GenderDropdown(
                      selectedGender: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    MetricWidget(
                      controller: weightController,
                      label: 'Weight',
                      unit: 'Kg',
                    ),
                    const SizedBox(height: 20),
                    MetricWidget(
                      controller: heightController,
                      label: 'Height',
                      unit: 'Cm',
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: ageController,
                      label: 'Age',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        // Navigate or save data
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(WidgetState.disabled)) {
                        return const Color(0xFFEAECF0); // inactive background
                      }
                      return const Color(0xFFF25700); // active background
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(WidgetState.disabled)) {
                        return const Color(0xFF57636C); // inactive text
                      }
                      return Colors.white; // active text
                    },
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
