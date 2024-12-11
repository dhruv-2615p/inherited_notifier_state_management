import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Inherited Notifier',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final sliderData = SliderData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: SliderInheritedNotifier(
        sliderData: sliderData,
        child: Builder(builder: (context) {
          return Column(
            children: [
              Slider(
                value: SliderInheritedNotifier.of(context),
                onChanged: (value) {
                  sliderData.value = value;
                },
                thumbColor: Colors.red,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: SliderInheritedNotifier.of(context),
                    child: Container(
                      color: Colors.yellow,
                      height: 260,
                    ),
                  ),
                  Opacity(
                    opacity: SliderInheritedNotifier.of(context),
                    child: Container(
                      color: Colors.blue,
                      height: 260,
                    ),
                  )
                ].expandEqually().toList(),
              )
            ],
          );
        }),
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (e) {
          return Expanded(child: e);
        },
      );
}

class SliderData extends ChangeNotifier {
  double _value = 0.0;

  double get value => _value;

  set value(double newValue) {
    if (_value != newValue) _value = newValue;
    notifyListeners();
  }
}

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
  const SliderInheritedNotifier({
    super.key,
    required super.child,
    required SliderData sliderData,
  }) : super(notifier: sliderData);

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
          ?.notifier
          ?.value ??
      0.0;
}
