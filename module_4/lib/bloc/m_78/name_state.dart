class NameState {
  final List<String> names;

  NameState(this.names);

  NameState copyWith({List<String>? names}) {
    return NameState(names ?? this.names);
  }
}