class Order {
  final String name;
  final String description;
  final String orderPlacerName;
  final String orderSummary;
  final String orderLocation;
  final String orderPlacerPhone;

  const Order({
    required this.name,
    required this.description,
    required this.orderPlacerName,
    required this.orderSummary,
    required this.orderLocation,
    required this.orderPlacerPhone,
  });
}

List<Order> orders = const [
  Order(
    name: 'Product 1',
    description: 'Description of Product 1',
    orderPlacerName: 'John Doe',
    orderSummary: 'Summary of Product 1 order',
    orderLocation: '123 Main Street, City, Country',
    orderPlacerPhone: '+1234567890',
  ),
  Order(
    name: 'Product 2',
    description: 'Description of Product 2',
    orderPlacerName: 'Jane Smith',
    orderSummary: 'Summary of Product 2 order',
    orderLocation: '456 Elm Street, Town, Country',
    orderPlacerPhone: '+0987654321',
  ),
  Order(
    name: 'Product 3',
    description: 'Description of Product 3',
    orderPlacerName: 'Alice Johnson',
    orderSummary: 'Summary of Product 3 order',
    orderLocation: '789 Oak Street, Village, Country',
    orderPlacerPhone: '+1122334455',
  ),
];
