
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:memoire/utilities/user_pref.dart';

AppBar buildAppBar(BuildContext context) {


  return AppBar(
    leading: BackButton(
      color: Color(0xFF398AE5),
      
      
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
      icon: Icon(
        Icons.save,
        color: Color(0xFF398AE5),
        // size: 32,
      ),
      onPressed: () {
        // do something
      },
    )
    
    ],
  );
}