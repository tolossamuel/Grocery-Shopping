

import 'package:flutter/material.dart';


class BackIcons extends StatelessWidget {
  const BackIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              key : const Key('backIcon'),
              onTap: () => {
                
                Navigator.pop(context),
              },
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.fromLTRB(10,30,10,20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white
                ),
                child: const Icon(Icons.arrow_back_ios_new,color: Colors.blue,),
              ),
            );
  }
}