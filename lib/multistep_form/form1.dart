import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multistep_form/widgets/dropdownfield.dart';
import 'package:multistep_form/widgets/textfield.dart';

class personalProfileForm extends StatefulWidget {
  const personalProfileForm({Key? key}) : super(key: key);

  @override
  _personalProfileFormState createState() => _personalProfileFormState();
}

class _personalProfileFormState extends State<personalProfileForm> {
  File? _profileImage;
  String? selectedGender;

  // Function to pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Show Dialog to select image source (Camera or Gallery)
   void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile picture section
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 55,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const NetworkImage(
                        "https://www.pinclipart.com/picdir/middle/552-5526227_cartoon-school-student-png-clipart.png",
                      ) as ImageProvider,
              ),
            ),
            GestureDetector(
              onTap: () =>_showImageSourceDialog(), // Show dialog on tap
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: const Icon(Icons.add_a_photo, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomTextField(icon: Icons.person, hintText: 'Name'),
        CustomDropdownField<String>(
          hintText: 'Select Gender',
          options: ['Male', 'Female', 'Others'],
          icon: Icons.person_3,
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
            });
          },
        ),
        Row(
          children: [
            Expanded(child: CustomTextField(icon: Icons.location_city, hintText: 'City')),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.email, hintText: 'Email', isEmail: true)),
          ],
        ),
        CustomTextField(icon: Icons.map, hintText: 'Zone'),
        CustomTextField(icon: Icons.home, hintText: 'Address 1'),
        CustomTextField(icon: Icons.home, hintText: 'Address 2'),
        Row(
          children: [
            Expanded(child: CustomTextField(icon: Icons.pin_drop, hintText: 'Pin Code')),
            const SizedBox(width: 20),
            Expanded(child: CustomTextField(icon: Icons.confirmation_number, hintText: 'GST Number')),
          ],
        ),
        CustomTextField(icon: Icons.phone, hintText: 'Office Phone', isPhone: true),
        CustomTextField(icon: Icons.phone, hintText: 'Mobile', isPhone: true),
        CustomTextField(icon: Icons.web, hintText: 'Website'),
      ],
    );
  }
}
