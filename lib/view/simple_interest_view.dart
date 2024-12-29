import 'package:bloc_test/bloc/simple_interest_bloc.dart'; // Import the bloc for simple interest
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    principalController.dispose();
    rateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate Simple Interest"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: principalController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Principal",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: rateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Rate of Interest",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Time in Years",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            BlocBuilder<SimpleInterestBloc, double>(
              builder: (context, state) {
                return Text(
                  "Simple Interest: ${state.toStringAsFixed(2)}", // Display result with two decimal places
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final principal = double.tryParse(principalController.text);
                  final rate = double.tryParse(rateController.text);
                  final time = double.tryParse(timeController.text);

                  if (principal != null &&
                      rate != null &&
                      time != null &&
                      principal > 0 &&
                      rate > 0 &&
                      time > 0) {
                    context.read<SimpleInterestBloc>().add(
                          CalculateSimpleInterestEvent(
                            principal: principal,
                            rate: rate,
                            time: time,
                          ),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter valid values')),
                    );
                  }
                },
                child: const Text("Calculate Simple Interest"),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<SimpleInterestBloc>()
                      .add(ResetInterestEvent()); // Reset the result
                  principalController.clear();
                  rateController.clear();
                  timeController.clear();
                },
                child: const Text("Reset"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
