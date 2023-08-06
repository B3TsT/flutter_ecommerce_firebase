import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/providers/theme_provider.dart';
import 'package:shops/widgets/subtitle_text.dart';
import 'package:shops/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIsDarkTheme = context.watch<ThemeProvider>().getIsDarkTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SubtitleTextWidget(label: 'Hello world!!!'),
            TitlesTextWidget(
              label: 'Hello this is a title' * 10,
              maxLines: 4,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Hello World!')),
            SwitchListTile(
                title: Text(getIsDarkTheme ? 'Dark Mode' : 'Light Mode'),
                value: getIsDarkTheme,
                onChanged: (value) {
                  context.read<ThemeProvider>().setDarkTheme(value);
                })
          ],
        ),
      ),
    );
  }
}
