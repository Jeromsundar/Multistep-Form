// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multistep_form/widgets/datefield.dart';
import 'package:multistep_form/widgets/dropdownfield.dart';
import 'package:multistep_form/widgets/textfield.dart';

class EducationDetailsForm extends StatelessWidget {
  final String? selectedDegree; // Selected degree passed as a parameter
  final Function(String?)? onDegreeChanged; // Callback for degree selection
  final Function(String)? onTextFieldChanged; // Callback for text field input

  const EducationDetailsForm({
    Key? key,
    this.selectedDegree,
    this.onDegreeChanged,
    this.onTextFieldChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomDropdownField<String>(
          hintText: 'Select Degree',
          options: ['B.Sc', 'M.Sc', 'B.Tech', 'M.Tech', 'MBA', 'MCA'],
          icon: Icons.school,
          onChanged: (String? newValue) {
            onDegreeChanged?.call(newValue);
          },
        ),
        Row(
          children: [
            Expanded(child: CustomTextField(icon: Icons.location_city, hintText: 'City of Institution')),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.email, hintText: 'Institution Email', isEmail: true)),
          ],
        ),
        CustomTextField(icon: Icons.book, hintText: 'Course Name'),
        
        Row(
          children: [
            Expanded(child: CustomTextField(icon: Icons.pin_drop, hintText: 'Pin Code',)),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.grade, hintText: 'Grade/Percentage')),
          ],
        ),
        CustomTextField(icon: Icons.phone, hintText: 'Institution Contact Number', isPhone: true),
        CustomTextField(icon: Icons.web, hintText: 'Institution Website'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: CustomDateField(icon: Icons.date_range, hintText: 'Start Date', ), ),
            const SizedBox(width: 20),
            Expanded(child: CustomDateField(icon: Icons.date_range, hintText: 'End Date',), )
          ],
        ),
        
      ],
    );
  }
}
