import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class TableProvider with ChangeNotifier {
  TableModel? _currentTable;
  bool _isLoading = false;
  String _errorMessage = '';

  TableModel? get currentTable => _currentTable;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<bool> findTable(String phoneNumber) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // YOUR REAL CLOUD RUN URL
      final String baseUrl = "https://check-table-189589266328.asia-southeast2.run.app";
      
      // We send the phone number as a parameter: ?phone=0123...
      final url = Uri.parse('$baseUrl?phone=$phoneNumber');
      
      print("Connecting to: $url"); // For debugging

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _currentTable = TableModel.fromJson(data);
        _isLoading = false;
        notifyListeners();
        return true; // Success
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      _isLoading = false;
      _errorMessage = "Failed to get table. Check internet or phone number.";
      print(e); // Print error to console
      notifyListeners();
      return false; // Failed
    }
  }
}