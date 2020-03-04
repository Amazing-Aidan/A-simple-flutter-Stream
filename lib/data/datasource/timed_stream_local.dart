import 'dart:async';

class TimedStream {
  final _controller = StreamController<int>();
  var _count = 1;

  TimedStream(){
    Timer.periodic(Duration(seconds: 1), (tick){
      _controller.sink.add(_count);
      _count++;
    });
  }

  Stream<int> get stream => _controller.stream;
  void get onExit => _controller.sink.close();

  void close() {
     _controller.close();
  }
}