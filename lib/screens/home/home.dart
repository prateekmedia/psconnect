import 'package:flutter/material.dart';

import 'package:psconnect/utils/utils.dart';
import 'package:psconnect/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int devices = 5;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> deviceName = ValueNotifier("Galaxy On6");

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
              ValueListenableBuilder<String>(
                  valueListenable: deviceName,
                  builder: (_, val, __) => Text(
                        val,
                        style: const TextStyle(color: Colors.white),
                      )),
              const Spacer(),
              IconButton(
                tooltip: 'Edit',
                icon: const Icon(Icons.edit),
                onPressed: () {
                  final nameController = TextEditingController(text: deviceName.value);
                  submit() {
                    if (nameController.text.isNotEmpty) {
                      deviceName.value = nameController.text;
                    }
                    context.pop();
                  }

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Device Name"),
                      content: TextField(
                        autofocus: true,
                        controller: nameController,
                        onSubmitted: (_) => submit(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: context.pop,
                          child: const Text("CANCEL"),
                        ),
                        TextButton(
                          onPressed: submit,
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
