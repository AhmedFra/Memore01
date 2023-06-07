import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Muinput extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const Muinput({Key? key,
  required this.hint ,
  required this.title,
  this.controller,
  this.widget}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left:14 ),
            decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey,
                width :1.0
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget==null?false:true,
                  autofocus: false,
                  cursorColor: Colors.grey,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 0
                      )
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 0
                      )
                    ),
                  ),
                )

              ),
              widget==null?Container():Container(child: widget,),
            ],
            ) ,
          )
        ],
      ),

    );
  }
}