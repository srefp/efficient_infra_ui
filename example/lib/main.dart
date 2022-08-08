import 'package:efficient_infra_ui/explosion/widgets/win_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("infra_ui"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            WinNavigation(
              items: [
                NavItem(text: '文件', route: 'file'),
                NavItem(text: '匹配效果', route: 'effect'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
