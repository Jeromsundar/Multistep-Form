
import 'package:flutter/material.dart';
import 'package:multistep_form/widgets/datefield.dart';
import 'package:multistep_form/widgets/dropdownfield.dart';
import 'package:multistep_form/widgets/textfield.dart';

class OthersDetailsForm extends StatelessWidget {
  final String? selectedDepartment; // Selected department passed as a parameter
  final Function(String?)? onDepartmentChanged; // Callback for department selection
  final Function(String)? onTextFieldChanged; 

  const OthersDetailsForm({
    Key? key,
    this.selectedDepartment,
    this.onDepartmentChanged,
    this.onTextFieldChanged,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTextField(icon: Icons.person, hintText: 'Reference Name'),
        CustomDropdownField<String>(
          hintText: 'Select Department',
          options: ['HR', 'Finance', 'Engineering', 'Computer science', 'Marketing'],
          icon: Icons.business,
          onChanged: (String? newValue) {
            onDepartmentChanged?.call(newValue);
          },
        ),
        Row(
          children: [
            Expanded(child: CustomTextField(icon: Icons.location_city, hintText: 'Location')),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.email, hintText: 'Reference Email', isEmail: true)),
          ],
        ),
        CustomTextField(icon: Icons.notes, hintText: 'Additional Notes'),
        Row(
          children: [
            Expanded(child: CustomDateField(icon: Icons.date_range, hintText: 'Date of Joining', ),),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.calendar_today, hintText: 'Leave Balance'),),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: CustomTextField(icon: Icons.pin_drop, hintText: 'Location Code',)),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.contact_phone, hintText: 'Emergency Contact Number', isPhone: true)),
          ],
        ),
        CustomTextField(icon: Icons.language, hintText: 'Preferred Language'),
        CustomTextField(icon: Icons.web, hintText: 'Website Link'),
      ],
    );
  }
}
