import 'package:bloc_test/bloc/area_circle_bloc.dart'; // Import your area_circle_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCircleView extends StatefulWidget {
  const AreaCircleView({super.key});

  @override
  State<AreaCircleView> createState() => _AreaCircleViewState();
}

class _AreaCircleViewState extends State<AreaCircleView> {
  final radiusController = TextEditingController();

  @override
  void dispose() {
    radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate Area Of Circle"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Radius",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            BlocBuilder<AreaCircleBloc, double>(
              // Update state type to double
              builder: (context, state) {
                return Text(
                  "Result: ${state.toStringAsFixed(2)}", // Display the result with two decimal places
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final radius = double.tryParse(radiusController.text);
                  if (radius != null && radius > 0) {
                    context.read<AreaCircleBloc>().add(CalculateAreaEvent(
                        radius)); // Dispatch the event with the radius
                  } else {
                    // Show an error if the input is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid radius')),
                    );
                  }
                },
                child: const Text("Calculate Area"),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<AreaCircleBloc>()
                      .add(ResetAreaEvent()); // Reset the area
                  radiusController.clear();
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
