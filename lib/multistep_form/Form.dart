import 'package:flutter/material.dart';
import 'package:multistep_form/multistep_form/form1.dart';
import 'package:multistep_form/multistep_form/form2.dart';
import 'package:multistep_form/multistep_form/form3.dart';
import 'package:multistep_form/widgets/navbtn.dart';
import 'package:multistep_form/widgets/step_indicator.dart';

class MultiStepCustomerForm extends StatefulWidget {
  const MultiStepCustomerForm({super.key});

  @override
  _MultiStepCustomerFormState createState() => _MultiStepCustomerFormState();
}

class _MultiStepCustomerFormState extends State<MultiStepCustomerForm> {
   int _currentStep = 0;

  void _changeStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  void _submitForm() {
    // Your submit logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form submitted successfully!')),
    );
  }
//main page allignment for full form
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 236, 205, 242),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 220, 229, 244),
  title: const Text("Multi step  Form",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),),
                centerTitle: true,
              ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          StepIndicator(
                currentStep: _currentStep,
                formNames: ['Personal Details', 'Education Details', 'Others'],
              ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 5,
                shadowColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                                  _getStepContent(),
                                  NavigationButtons(
                        currentStep: _currentStep,
                        onStepChange: _changeStep,
                        onSubmit: _submitForm, totalSteps: 3,
                      ),
                    ],
                  ),
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStepContent() {
    switch (_currentStep) {
      case 0:
        return personalProfileForm();
      case 1:
        return EducationDetailsForm();
      case 2:
        return OthersDetailsForm();
      default:
        return Container();
    }
  }
}
