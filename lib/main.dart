import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:psconnect/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int devices = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: devices != 0
          ? const RenderDevices()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'No Devices found.',
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        // shape: NotchedShape(),
        color: context.primaryColor,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              const Text(
                "Galaxy On6",
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                tooltip: 'Edit',
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RenderDevices extends StatelessWidget {
  const RenderDevices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text connectionStatus(index) => Text(
          ["Connected", "Paired", "Available"][index % 3],
          style: TextStyle(
              color: [
            Colors.green[context.isDark ? 400 : 600],
            Colors.red[context.isDark ? 400 : 600],
            null
          ][index % 3]),
        );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: context.width >= mobileBreakpoint
          ? Wrap(
              children: [
                for (var index in List.generate(5, (index) => index))
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: context.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Icon([LucideIcons.smartphone, LucideIcons.tablet, LucideIcons.tv2][index % 3], size: 40),
                        const SizedBox(height: 10),
                        Text(
                          ["Item A41", "Lenovo TB3-850F", "iFFalcon TV", "Lava iris", "Samsung Tab S7"][index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        connectionStatus(index),
                      ],
                    ),
                  ),
              ],
            )
          : Column(
              children: [
                for (var index in List.generate(5, (index) => index))
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: context.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon([LucideIcons.smartphone, LucideIcons.tablet, LucideIcons.tv2][index % 3], size: 32),
                        const SizedBox(width: 12),
                        Text(
                          ["Item A41", "Lenovo TB3-850F", "iFFalcon TV", "Lava iris", "Samsung Tab S7"][index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        connectionStatus(index),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}