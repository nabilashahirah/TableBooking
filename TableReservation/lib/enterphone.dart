import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'tableno.dart';

class EnterPhoneScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Container(
            // Imitating a phone frame
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Phone No", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter number...",
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(height: 20),
                
                Consumer<TableProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return CircularProgressIndicator(color: Colors.black);
                    }
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                      onPressed: () async {
                        if (_controller.text.isEmpty) return;
                        
                        bool success = await provider.findTable(_controller.text);
                        
                        if (success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TableNoScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(provider.errorMessage)),
                          );
                        }
                      },
                      child: Text("Check"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}