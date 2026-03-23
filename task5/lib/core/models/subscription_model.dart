class Subscription {
  final String name;
  final double price;
  final String frequency;
  final String category;
  final String paymentMethod;
  final DateTime startDate;
  final DateTime renewalDate;

  Subscription({
    required this.name,
    required this.price,
    required this.frequency,
    required this.category,
    required this.paymentMethod,
    required this.startDate,
    required this.renewalDate,
  });

  // Factory method to create from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      name: json['name'] as String,
      price: json['price'] as double,
      frequency: json['frequency'] as String,
      category: json['category'] as String,
      paymentMethod: json['paymentMethod'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      renewalDate: DateTime.parse(json['renewalDate'] as String),
    );
  }

  // Calculate status based on renewal date
  String get status {
    final now = DateTime.now();
    final daysUntilRenewal = renewalDate.difference(now).inDays;

    if (renewalDate.isBefore(now)) {
      // Renewal date has passed
      return "Expired";
    } else if (daysUntilRenewal <= 7) {
      // 7 days or less until renewal
      return "Expiring Soon";
    } else {
      // Still have more than 7 days
      return "Active";
    }
  }

  // Get days until renewal
  int get daysUntilRenewal {
    final now = DateTime.now();
    return renewalDate.difference(now).inDays;
  }
}
