# float_elf

float_elf是一个非常简单的实现app内部可拖动悬浮球的框架

## 开始使用

float_elf 使用非常简单, 你只需要自定义你想要的悬浮球外观, 比如下面这样:

```dart

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

```
然后只需要一行代码就能显示你的悬浮球了:

```dart

Elf.show(context, Offset(25, 50), elfContent);

```

同样, 关闭悬浮球也只需要一行代码:

```dart

Elf.hide()

```