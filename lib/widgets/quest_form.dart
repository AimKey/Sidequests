import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestForm extends StatefulWidget {
  final String currentLocation;
  @override
  const QuestForm({required this.currentLocation, Key? key}) : super(key: key);
  @override
  State<QuestForm> createState() => _QuestFormState();
}

class _QuestFormState extends State<QuestForm> {
  final _tittleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _paymentController = TextEditingController();

  File? image;
  int _currentStep = 0;
  bool isAutoLocation = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        physics: const ClampingScrollPhysics(),
        currentStep: _currentStep,
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
                    title: const Text("Quest created, please wait for adventurer!"),
                    content: Column(children: [
                      Text(
                          'Tittle: ${_tittleController.text}\nDescription: ${_descriptionController.text}\nLocation: ${_locationController.text}\nPayment: ${_paymentController.text}'),
                      image == null
                          ? const Text("No image selected")
                          : Image.file(
                              image!,
                            ),
                    ]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Alright")),
                    ],
                  );
                });
          } else {
            setState(() {
              _currentStep++;
            });
          }
        },
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        title: const Text("Title and despcrition"),
        content: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Tittle",
                errorMaxLines: 10,
              ),
              controller: _tittleController,
            ),
            const SizedBox(height: 20, width: 20),
            TextFormField(
              maxLines: null,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelText: "Task description",
                labelStyle: TextStyle(fontSize: 20),
              ),
              controller: _descriptionController,
            ),
            const SizedBox(height: 20, width: 20),
            TextFormField(
              enabled: !isAutoLocation,
              controller: _locationController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Enter your location",
                errorMaxLines: 2,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                const Text(
                  "Use current location",
                  style: TextStyle(fontSize: 16),
                ),
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  value: isAutoLocation,
                  onChanged: (newBool) {
                    setState(() {
                      isAutoLocation = newBool!;
                    });
                  },
                )
              ],
            ),
            image == null
                ? const Text("No image selected")
                : Image.file(
                    image!,
                  ),
            ElevatedButton(
              onPressed: pickImg,
              child: const Text("Upload image"),
            ),
          ],
        ),
      ),
      Step(
        title: const Text("Payment options"),
        content: Column(
          children: [
            TextFormField(
              controller: _paymentController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
                labelText: "Name your price",
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Future pickImg() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;
    setState(() {
      image = File(img.path);
    });
  }
}
