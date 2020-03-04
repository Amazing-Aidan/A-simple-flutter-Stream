import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/datasource/timed_stream_local.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: TimedStream().stream.map((i) => '${i.toString()}'),
            builder: (context, AsyncSnapshot data) {
              if (data.connectionState == ConnectionState.waiting) {
                return Text('No data yet');
              } else if (data.connectionState == ConnectionState.done) {
                return Text('Done!');
              }
              return Text("${data.data}");
            } ),
      ),
    );
  }

}
