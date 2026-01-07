class TableModel {
  final String phone;
  final String tableNo;

  TableModel({required this.phone, required this.tableNo});

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      // The app expects 'phone', database sends 'phone'
      phone: json['phone'] ?? '',
      // The app expects 'tableNo', but your database sends 'table'
      tableNo: json['table'] ?? 'Pending', 
    );
  }
}