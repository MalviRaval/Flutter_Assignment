abstract class NameEvent {}

class AddName extends NameEvent {
  final String name;
  AddName(this.name);
}

class DeleteName extends NameEvent {
  final String name;
  DeleteName(this.name);
}

class UpdateName extends NameEvent {
  final int index;
  final String newName;
  UpdateName(this.index, this.newName);
}
