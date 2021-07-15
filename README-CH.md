Language: [English](README.md) | [中文简体](README-CH.md)

# float_elf

float_elf是一个非常简单的实现app内部可拖动悬浮球的框架

## 开始使用

float_elf 使用非常简单, 你只需要自定义你想要的悬浮球外观, 比如下面这样:

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
然后只需要一行代码就能显示你的悬浮球了:

```dart

Elf.show(context, Offset(25, 50), elfContent);

```

同样, 关闭悬浮球也只需要一行代码:

```dart

Elf.hide()

```