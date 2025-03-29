
abstract class CounterState {

}

class CounterValue extends CounterState {
  final double count;

  CounterValue(this.count);
}

// class DataFetched extends CounterState {
//   final List<dynamic> data;
//   DataFetched(this.data);
// }

// class LoadingState extends CounterState {}
