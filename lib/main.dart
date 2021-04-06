import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Socket Checker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _accessToken ='eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQwZTkwZjE1LWIwYWMtNDVhNi1hMzJkLWEyNjIxMjc5Y2M0NCIsInVzZXJfcHJvZmlsZXMiOiI5NDVkZjhjYjMxNTQ2OWQ1NGY2MGYwNDkwMzIyNjMwMSIsImlhdCI6MTYxNzY3ODU0OSwiZXhwIjoxNjE3NjgyMTQ5fQ.SVFy6kXNGJa0Tf4D3E1k1WDLFtjnmHbevqifEWx4f8VuKkAAh1cLX9NQfZ2nUnLkK9TMrwAwrhbDnJ9RPdhbXw';
  String _url = "https://socket-dev.kyubook.com/";
  IO.Socket socket;
  ///socket client.io
  void init(){
    print('outer ini');
    socket = IO.io(_url);
    socket.io.options['query'] = {'token': _accessToken};
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.onError((data) => print('error sdssd $data'));
  }

  void connection(){
    print('outer con');
    socket.onConnect((_) {
      print('connect');
    });
  }
  ///adhara socket
  // SocketIO socketIO;

  ///adhara socket
  // Future<void> socketInitial() async {
  //   socketIO = await SocketIOManager().createInstance(
  //       SocketOptions(_url,enableLogging: true));
  // }

  // Future<void> connectSocket() async {
  //
  //   socketIO.onConnect((data) {
  //     print('connect in method');
  //   });
  //   socketIO.emit('joinRoom', [{'room': '606bccdbc2460b54a2301bd1','forModule': 'post-comment'}]);
  //   socketIO.on('joinedRoom',(val)=>{
  //     print('data $val')
  //   });
  //
  //   ///connect socket
  //   socketIO.connect();
  //   socketIO.onConnectError((error) {
  //     print('error $error');
  //   });
  //
  //   socketIO.onDisconnect((value) {
  //     print('disConnect $value');
  //   });
  // }


  @override
  void initState() {
    init();
    // socketInitial().then((value){
    //   connectSocket().then((value){
    //
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [

      ],),
    );
  }
}
