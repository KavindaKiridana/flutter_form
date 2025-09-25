import 'package:flutter/material.dart';
import 'package:flutter_form/form_page.dart';
import 'package:flutter_form/asynchronous_page.dart';
import 'package:flutter_form/network_page.dart';

List<Widget> pages = [FormPage(), AsynchronousPage(), NetworkPage()];

class FormPae extends StatefulWidget {
  const FormPae({super.key});

  @override
  State<FormPae> createState() => _FormPaeState();
}

class _FormPaeState extends State<FormPae> {
  int pageNo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form - Tutorial 14'),
        backgroundColor: Colors.blueAccent,
      ),
      body: pages.elementAt(pageNo),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.note), label: 'form'),
          NavigationDestination(
            icon: Icon(Icons.signal_wifi_4_bar),
            label: 'asynchronous',
          ),
          NavigationDestination(
            icon: Icon(Icons.network_cell),
            label: 'network',
          ),
        ],
        onDestinationSelected: (value) {
          setState(() {
            pageNo = value;
          });
        },
        selectedIndex: pageNo,
      ),
    );
  }
}
