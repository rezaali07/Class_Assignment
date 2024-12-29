import 'package:bloc/bloc.dart';
import 'package:bloc_test/model/student.dart';
import 'package:equatable/equatable.dart';

abstract class StudentListEvent extends Equatable {
  const StudentListEvent();

  @override
  List<Object> get props => [];
}

class AddStudentEvent extends StudentListEvent {
  final Student student;
  const AddStudentEvent(this.student);

  @override
  List<Object> get props => [student];
}

class GetAllStudentsEvent extends StudentListEvent {}

class ClearStudentsEvent extends StudentListEvent {}

// --- States ---
abstract class StudentListState extends Equatable {
  const StudentListState();

  @override
  List<Object> get props => [];
}

class StudentListInitialState extends StudentListState {}

class StudentListLoadedState extends StudentListState {
  final List<Student> students;
  const StudentListLoadedState(this.students);

  @override
  List<Object> get props => [students];
}

class StudentListErrorState extends StudentListState {
  final String error;

  const StudentListErrorState(this.error);

  @override
  List<Object> get props => [error];
}

// --- Bloc ---
class StudentListBloc extends Bloc<StudentListEvent, StudentListState> {
  final List<Student> _students = [];

  StudentListBloc() : super(StudentListInitialState()) {
    on<AddStudentEvent>((event, emit) {
      _students.add(event.student);
      emit(StudentListLoadedState(
          List.from(_students))); // emit with updated list
    });

    on<GetAllStudentsEvent>((event, emit) {
      emit(StudentListLoadedState(List.from(_students))); // emit current list
    });

    on<ClearStudentsEvent>((event, emit) {
      _students.clear();
      emit(StudentListLoadedState([])); // emit an empty list
    });
  }
}
