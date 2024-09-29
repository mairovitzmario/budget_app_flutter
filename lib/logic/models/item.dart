class Item {
  String _name;
  double _price;
  int _quantity;
  final DateTime _date;

  Item({
    required String name,
    required double price,
    required int quantity,
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        _date = DateTime.now();

  //NAME
  set name(String value) {
    _name = value;
  }

  String get name => _name;

  //PRICE
  set price(double value) {
    if (value < 0) {
      throw ArgumentError("Price cannot be negative");
    }
    _price = value;
  }

  double get price => _price;

  //QUANTITY
  set quantity(int value) {
    if (value < 0) {
      throw ArgumentError("Quantity cannot be negative");
    }
    _quantity = value;
  }

  int get quantity => _quantity;

  //DATE
  DateTime get date => _date;
}
