import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionTabStepper extends StatefulWidget {
  final String header; // parameter header
  final List<String> stepTexts;

  const ActionTabStepper({
    super.key,
    required this.header,
    required this.stepTexts,
  });

  @override
  _ActionTabStepperState createState() => _ActionTabStepperState();
}

class _ActionTabStepperState extends State<ActionTabStepper> {
  int _currentStep = 2; //Auto set currentstep to step 2

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 20,
                right: 20,
              ),
              child: Text(
                widget.header,
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: const Color(0xff7D1F1F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stepper(
                    currentStep: _currentStep,
                    onStepContinue: _currentStep < widget.stepTexts.length - 1
                        ? () {
                            setState(() {
                              _currentStep++;
                            });
                          }
                        : null,
                    onStepCancel: _currentStep > 0
                        ? () {
                            setState(() {
                              _currentStep--;
                            });
                          }
                        : null,
                    steps: List.generate(
                      widget.stepTexts.length,
                      (index) => Step(
                        title: Text(
                          widget.stepTexts[index],
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: const Color(0xff7D1F1F),
                          ),
                        ),
                        content: Container(),
                        isActive: _currentStep >= index,
                        state: _currentStep == index
                            ? StepState.indexed
                            : _currentStep > index
                                ? StepState.complete
                                : StepState.indexed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}