import 'package:flutter/material.dart';

class AsynchronousPage extends StatefulWidget {
  const AsynchronousPage({super.key});

  @override
  State<AsynchronousPage> createState() => _AsynchronousPageState();
}

class _AsynchronousPageState extends State<AsynchronousPage> {
  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 3));
    print('email came');
    return 'email came';
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text(snapshot.data));
        }
      },
    );
  }
}
