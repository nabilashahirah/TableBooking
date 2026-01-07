import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'enterphone.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TableProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EnterPhoneScreen(),
      ),
    ),
  );
}