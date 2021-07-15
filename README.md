Language: [English](README.md) | [中文简体](README-CH.md)

# float_elf

float_elf is a simple scheme for draggable floating ball in app, you can custom your own view of your elf and deploy it.

## Getting Started

float_elf is easy to use. Just customize your view like this:

```dart

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
                    )

```
And then to show your elf, just write one line:

```dart

Elf.show(context, Offset(25, 50), elfContent);

```

You can also hide your elf in one line:

```dart

Elf.hide()

```