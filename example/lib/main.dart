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
          ElfContent elfContent = ElfContent(
            builder: (context, clicked, controller) {
              return AnimatedPhysicalModel(
                curve: clicked ? Interval(0, 1) : Interval(0.5, 1.0),
                shadowColor: const Color(0xFF000000),
                shape: BoxShape.rectangle,
                duration: Duration(seconds: clicked ? 1 : 2),
                elevation: 8,
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(clicked ? 10 : 100)),
                child: AnimatedContainer(
                  curve: clicked ? Interval(0, 1) : Interval(0.5, 1.0),
                  duration: Duration(seconds: clicked ? 1 : 2),
                  height: clicked ? 120 : 50,
                  width: clicked ? 170 : 50,
                  transformAlignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: clicked ? Colors.white : Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(clicked ? 10 : 100)),
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 2),
                    reverseDuration: Duration(seconds: 1),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: CurvedAnimation(parent: animation, curve: clicked ? Interval(0.5, 1.0) : Interval(0, 1)),
                        child: ScaleTransition(
                          alignment: Alignment.topLeft,
                          scale: CurvedAnimation(parent: animation, curve: clicked ? Interval(0.5, 1.0) : Interval(0, 1)),
                          child: child,
                        ),
                      );
                    },
                    child: clicked
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Elf.hide();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                ],
                              )
                            ],
                          )
                        : Container(),
                  ),
                ),
              );
            },
          );

          Elf.show(context, Offset(25, 50), elfContent);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
