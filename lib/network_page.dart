import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  Future<String> getData() async {
    String email = await Future.delayed(Duration(seconds: 3), () {
      return 'kavinda@gmail.com';
    });
    return email;
  }

  Future<void> getNetworkRequest() async {
    print(await getData());
  }

  @override
  void initState() {
    super.initState();
    getNetworkRequest();
    print('other codes');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('network request'));
  }
}
