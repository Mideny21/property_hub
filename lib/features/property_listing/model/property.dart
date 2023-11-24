class Property {
  int? id;
  String? name;
  String? city;
  String? income;
  String? expenses;
  String? type;
  String? createdAt;
  String? lastUpdated;

  Property(
      {this.id,
      this.name,
      this.city,
      this.income,
      this.expenses,
      this.type,
      this.createdAt,
      this.lastUpdated});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    income = json['income'];
    expenses = json['expenses'];
    type = json['type'];
    createdAt = json['created_at'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['income'] = this.income;
    data['expenses'] = this.expenses;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
