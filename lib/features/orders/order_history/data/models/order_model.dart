class OrderModel {
  final int id;
  final String orderCode;
  final String date;
  final String status;
  final double total;

  OrderModel({
    required this.id,
    required this.orderCode,
    required this.date,
    required this.status,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderCode: json['order_code'],
      date: json['order_date'],
      status: json['status'],
      total: double.tryParse(json['total'].toString()) ?? 0.0,
    );
  }

  void operator [](int other) {}
}
