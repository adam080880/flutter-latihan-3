import 'package:flutter/material.dart';

class ToastAlert extends StatelessWidget {
  const ToastAlert({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        child: Row(
          children: const [
            Expanded(
              flex: 1,
              child: Text('Halo 3')
            )
          ],
        )
      )
    );
  }
}
