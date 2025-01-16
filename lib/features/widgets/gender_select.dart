import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  final Function(String) onGenderSelected;
  const GenderSelect({
    super.key,
    required this.onGenderSelected
    });

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.5,
          child: Radio<String>(
            value: 'Male',
            activeColor: AppColors.primary,
            groupValue: _selectedGender,
            onChanged: (value){
              setState(() => _selectedGender = value!);
              widget.onGenderSelected(value!);
            },
          ),
        ),
        Text("Male", style: TextStyle(fontSize: 16)),
        
        SizedBox(width: 20),

        Transform.scale(
          scale: 1.5,
          child: Radio<String>(
            value: 'Female',
            activeColor: AppColors.primary,
            groupValue: _selectedGender,
            onChanged: (value){
              setState(() => _selectedGender = value!);
              widget.onGenderSelected(value!);
            },
          ),
        ),
        Text("Female", style: TextStyle(fontSize: 16)),
      ],
    );
  }
}