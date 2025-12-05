class SparePart {
  final String name;
  final String partNumber;
  final double price;
  int quantity;

  SparePart({
    required this.name,
    required this.partNumber,
    required this.price,
    this.quantity = 0,
  });
}

class Catalog {
  final String name;
  final String image;
  final List<SparePart> parts;

  Catalog({
    required this.name,
    required this.image,
    required this.parts,
  });
}
