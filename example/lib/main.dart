import 'package:float_elf/float_elf.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
  MyHomePage({this.title});

  final String? title;

  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title!,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ElfPanel elfContent = ElfPanel(
            key: globalKey,
            items: [
              ElfItem.icon(Icons.add, '入口1', () {}),
              ElfItem.icon(Icons.android, '入口2', () {}),
              ElfItem.icon(Icons.close, '关闭悬浮球', () {
                if (Elf.hasShow) {
                  Elf.hide();
                }
              }),
            ],
          );

          Elf.show(
            context,
            Offset(25, 50),
            elfContent,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
