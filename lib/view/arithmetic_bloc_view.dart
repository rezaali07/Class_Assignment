import 'package:bloc_test/bloc/arithmetic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticBlocView extends StatefulWidget {
  const ArithmeticBlocView({super.key});

  @override
  State<ArithmeticBlocView> createState() => _ArithmeticBlocViewState();
}

class _ArithmeticBlocViewState extends State<ArithmeticBlocView> {
  final firstNumber = TextEditingController();
  final secondNumber = TextEditingController();

  @override
  void dispose() {
    firstNumber.dispose();
    secondNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arithmetic Bloc"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: firstNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "first number"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: secondNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "second number"),
            ),
            const SizedBox(height: 8),
            BlocBuilder<ArithmeticBloc, int>(
              builder: (context, state) {
                return Text(
                  "Result: $state",
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    int num1 = int.tryParse(firstNumber.text) ?? 0;
                    int num2 = int.tryParse(secondNumber.text) ?? 0;
                    context
                        .read<ArithmeticBloc>()
                        .add(IncrementEvent(first: num1, second: num2));
                  },
                  child: Text("Add")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    int num1 = int.tryParse(firstNumber.text) ?? 0;
                    int num2 = int.tryParse(secondNumber.text) ?? 0;
                    context
                        .read<ArithmeticBloc>()
                        .add(DecrementEvent(first: num1, second: num2));
                  },
                  child: Text("Subtract")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    int num1 = int.tryParse(firstNumber.text) ?? 0;
                    int num2 = int.tryParse(secondNumber.text) ?? 0;
                    context
                        .read<ArithmeticBloc>()
                        .add(MultiplyEvent(first: num1, second: num2));
                  },
                  child: Text("Multiply")),
            ),
          ],
        ),
      ),
    );
  }
}
