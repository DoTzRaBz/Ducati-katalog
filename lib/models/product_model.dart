class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String specs;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.specs,
  });

  // Static list of all products, accessible from anywhere in the app
  static final List<Product> products = [
    Product(
      id: 1,
      name: 'Ducati Panigale V4',
      price: 1250000000,
      image: 'assets/panigale.png',
      description:
          'Superbike legendaris dengan mesin V4 1103cc, tenaga 214 HP, teknologi racing terdepan.',
      specs: 'Engine: 1103cc | Power: 214 HP | Weight: 195 kg',
    ),
    Product(
      id: 2,
      name: 'Ducati Monster',
      price: 485000000,
      image: 'assets/monster.png',
      description:
          'Naked bike ikonik dengan desain minimalis, handling lincah, perfect untuk urban riding.',
      specs: 'Engine: 937cc | Power: 111 HP | Weight: 188 kg',
    ),
    Product(
      id: 3,
      name: 'Ducati Scrambler',
      price: 389000000,
      image: 'assets/scrambler.png',
      description:
          'Gaya retro modern yang fun, mudah dikendarai, dan penuh karakter.',
      specs: 'Engine: 803cc | Power: 73 HP | Weight: 189 kg',
    ),
    Product(
      id: 4,
      name: 'Ducati Multistrada V4',
      price: 850000000,
      image: 'assets/multistrada.png',
      description:
          'Motor adventure serba bisa untuk touring jarak jauh maupun harian.',
      specs: 'Engine: 1158cc | Power: 170 HP | Weight: 240 kg',
    ),
    Product(
      id: 5,
      name: 'Ducati Diavel 1260',
      price: 750000000,
      image: 'assets/diavel.png',
      description:
          'Power cruiser dengan desain sangar, torsi melimpah, dan performa brutal.',
      specs: 'Engine: 1262cc | Power: 162 HP | Weight: 244 kg',
    ),
    Product(
      id: 6,
      name: 'Ducati SuperSport 950',
      price: 600000000,
      image: 'assets/supersport.png',
      description:
          'Sport-touring yang nyaman untuk harian namun tetap punya DNA racing Ducati.',
      specs: 'Engine: 937cc | Power: 110 HP | Weight: 210 kg',
    ),
  ];
}
