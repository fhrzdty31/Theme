import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dark = false;
  bool theme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Theme",
      theme: (dark)
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: (theme) ? Colors.deepOrange : Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Theme"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Switch(
                value: dark,
                onChanged: (value) {
                  setState(() {
                    dark = !dark;
                  });
                  theme = false;
                },
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Green",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Switch(
                    value: theme,
                    onChanged: (value) {
                      setState(() {
                        theme = !theme;
                      });
                    }),
                const Text(
                  "Orange",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Text(
              "(*Color theme doesn't support in dark mode)",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
