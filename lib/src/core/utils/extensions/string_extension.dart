extension StringExtension on String {
  //Capitalise string
  //Example: hello world => Hello World
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }
}
