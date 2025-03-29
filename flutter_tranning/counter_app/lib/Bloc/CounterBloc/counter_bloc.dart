

import 'package:counter_app/Bloc/CounterBloc/counter_event.dart';
import 'package:counter_app/Bloc/CounterBloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValue(0)) {
    on<Increment>((event, emit) {
      if (state is CounterValue) {
        emit(CounterValue((state as CounterValue).count + 1));
      }
    });

    on<Decrement>((eventDecrement, emit) {
      if (state is CounterValue) {
        emit(CounterValue((state as CounterValue).count - 1));
      }
    });
  }
}





// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterValue(0)) {
//     on<Increment>((event, emit) {
//       if (state is CounterValue) {
//         emit(CounterValue((state as CounterValue).count + 1));
//       }
//     });
//     on<Decrement>((event, emit) {
//       if (state is CounterValue) {
//         emit(CounterValue((state as CounterValue).count - 1));
//       }
//     });
//     on<FetchData>((event, emit) async {
//       emit(LoadingState());
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         emit(DataFetched(data));
//       } else {
//         emit(DataFetched([]));
//       }
//     });
//   }
// }