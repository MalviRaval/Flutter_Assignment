import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_4/bloc/m_78/name_event.dart';
import 'package:module_4/bloc/m_78/name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameState([])) {
    on<AddName>((event, emit) {
      print(state.names);
      final updatedNames = List<String>.from(state.names)..add(event.name);
      emit(state.copyWith(names: updatedNames));
    });
    on<DeleteName>((event, enit) {
      final updatedNames = List<String>.from(state.names)..remove(event.name);
      emit(state.copyWith(names: updatedNames));
    });
    on<UpdateName>((event, emit) {
      final updatedNames = List<String>.from(state.names)
        ..removeAt(event.index)
        ..insert(event.index, event.newName);
      emit(state.copyWith(names: updatedNames));
    });
  }
}
