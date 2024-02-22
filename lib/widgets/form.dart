import 'package:flutter/material.dart';

class QuestForm extends StatefulWidget {
  @override
  State<QuestForm> createState() => _QuestFormState();
}

class _QuestFormState extends State<QuestForm> {
  final _tittleController = TextEditingController();
  final _locationController = TextEditingController();
  final _requirementController = TextEditingController();
  final _rankController = TextEditingController();

  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        steps: getSteps(),
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        onStepContinue: () {
          final isLastStep = _currentStep == getSteps().length - 1;
          if (isLastStep) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Form submitted!"),
                    content: Text('Your form has been submitted!'),
                    actions: [
                      // Navigator.pop(context),
                      //TODO: Add a button to navigate to the previous screen
                      TextButton(onPressed: () {}, child: Text("Ok")),
                    ],
                  );
                });
          }
        },
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        title: const Text("Title"),
        content: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Enter your title",
                errorMaxLines: 10,
              ),
              controller: _tittleController,
            ),
            const SizedBox(height: 20, width: 20),
            Image.asset("lib/assets/steal_hearts.jpg", height: 200, fit: BoxFit.cover),
          ],
        ),
      ),
      Step(
        title: const Text("Location"),
        content: Column(
          children: [
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Enter your location",
                border: OutlineInputBorder(),
                errorMaxLines: 2,
              ),
            ),
          ],
        ),
      ),
      Step(
        title: const Text("Requirement"),
        content: Column(
          children: [
            TextFormField(
              controller: _requirementController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Enter your requirement",
                border: OutlineInputBorder(),
                errorMaxLines: 2,
              ),
            ),
          ],
        ),
      ),
      Step(
        title: const Text("Rank"),
        content: Column(
          children: [
            TextFormField(
              controller: _rankController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Enter your rank",
                border: OutlineInputBorder(),
                errorMaxLines: 2,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
