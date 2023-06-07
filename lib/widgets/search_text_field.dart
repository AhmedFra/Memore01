import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Color(0xFF398AE5), size: 26,),
        suffixIcon: const Icon(Icons.filter_list, color: Color(0xFF398AE5), size: 26,),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Search',
        labelStyle: TextStyle(color: Colors.black26,),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
       
      ),
    );
  }
}