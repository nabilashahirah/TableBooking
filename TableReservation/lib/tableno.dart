import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class TableNoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tableData = Provider.of<TableProvider>(context).currentTable;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          // Imitating a phone frame
          width: 300,
          height: 500,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your table no", style: TextStyle(fontSize: 22, color: Colors.grey[700])),
              SizedBox(height: 40),
              Text(
                tableData?.tableNo ?? "--",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}