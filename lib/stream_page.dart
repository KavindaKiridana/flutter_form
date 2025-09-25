import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  StreamController controller = StreamController();

  //method 1->we can do more customizations in this way.but if we have to do second stream,then we need to close first stream due to memory leaking
  addStreamData() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      controller.sink.add(i);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // controller.close();
  }

  Stream<int> addStreamData2() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield (i);
    }
  }

  @override
  void initState() {
    super.initState();
    //addStreamData();
    addStreamData2();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: addStreamData2(), //controller.stream,
        builder: (context, AsyncSnapshot asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            );
          }
          if (asyncSnapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(asyncSnapshot.data.toString())],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(asyncSnapshot.stackTrace.toString())],
            );
          }
        },
      ),
    );
  }
}
