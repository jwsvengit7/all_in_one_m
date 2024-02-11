import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String? message;

  const LoadingIndicator({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            if (message != null)
              Text(
                message!,
                style: TextStyle(color: Colors.white),
              )
          ],
        ),
      ),
    );
  }
}


//to use
//LoadingIndicator(message: 'Loading...'),
