import 'package:bloc_test/bloc/student_list_bloc.dart';
import 'package:bloc_test/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentListView extends StatefulWidget {
  const StudentListView({super.key});

  @override
  State<StudentListView> createState() => _StudentListViewState();
}

class _StudentListViewState extends State<StudentListView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // TextFields to input student details (name, address, and age)
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Enter Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Enter Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            // Button to add student
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                final address = _addressController.text.trim();
                final age = int.tryParse(_ageController.text.trim()) ?? 0;

                if (name.isNotEmpty && address.isNotEmpty && age > 0) {
                  final student =
                      Student(name: name, address: address, age: age);
                  context.read<StudentListBloc>().add(AddStudentEvent(student));
                  _nameController.clear();
                  _addressController.clear();
                  _ageController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter valid student details')),
                  );
                }
              },
              child: const Text('Add Student'),
            ),
            const SizedBox(height: 8),
            // BlocBuilder to display list of students
            BlocBuilder<StudentListBloc, StudentListState>(
              builder: (context, state) {
                if (state is StudentListLoadedState) {
                  if (state.students.isEmpty) {
                    return const Text('No students added.');
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.students.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.students[index].name),
                          subtitle: Text(
                            'Address: ${state.students[index].address}, Age: ${state.students[index].age}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context
                                  .read<StudentListBloc>()
                                  .add(ClearStudentsEvent());
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(height: 8),
            // Button to clear student list
            ElevatedButton(
              onPressed: () {
                context.read<StudentListBloc>().add(ClearStudentsEvent());
              },
              child: const Text('Clear Student List'),
            ),
          ],
        ),
      ),
    );
  }
}
