import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building main page');
    return ChangeNotifierProvider(
      create: (context) =>
          AppData(), //creates an instance of the AppData class.
      builder: (context, child) {
        //builds the rest of the widget.
        return Scaffold(
          appBar: AppBar(
              //title: Text(Provider.of<AppData>(context, listen: true).name),
              //title: Text(context.watch<AppData>().name),
              title: Consumer<AppData>(
            builder: (context, value, child) {
              return Text(value.name);
            },
          )),
          body: Screen2(),
        );
      },
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building screen2');
    return Container(
      child: Screen3(),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text(Provider.of<AppData>(context).name),
          //Text(context.watch<AppData>().name),
          Consumer<AppData>(
            builder: (context, value, child) {
              return Text(value.name);
            },
          ),
          ElevatedButton(
            onPressed: () {
              //Provider.of<AppData>(context, listen: false).changeData('Chuck Norris');
              context.read<AppData>().changeData('Saiyan Bazu');
            },
            child: Text('Change Data'),
          ),
        ],
      ),
    );
  }
}

class AppData with ChangeNotifier {
  String _name = 'Dave Coder';
  void changeData(String data) {
    _name = data;
    notifyListeners();
  }

  String get name => _name;
}
