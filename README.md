Language: [English](README.md) | [中文简体](README-CH.md)

# float_elf

float_elf is a simple scheme for draggable floating ball in app, you can custom your own view of your elf and deploy it.

## Getting Started

float_elf is easy to use. Just customize your view like this:

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
And then to show your elf, just write one line:

```dart

Elf.show(context, Offset(25, 50), elfContent);

```

You can also hide your elf in one line:

```dart

Elf.hide()

```