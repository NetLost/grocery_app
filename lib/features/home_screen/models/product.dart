class Product {
  final String title;
  final String? image;

  Product({required this.title, this.image});
}

List<Product> productsList = [
  Product(title: 'Cabbage', image: 'assets/images/img_1.png'),
  Product(title: 'Broccoli', image: 'assets/images/img_2.png'),
  Product(title: 'Carrot', image: 'assets/images/img_3.png'),
  Product(title: 'Pakcoy', image: 'assets/images/img_4.png'),
  Product(title: 'Cucumber', image: 'assets/images/img_1.png'),
];
