import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('"CHOOSE"'),
          content: const Text(
            'Here was no plaint that could be heard of grief, \n'
            'Except of sighs, which made the eternal air '
            'Tremble and tremble strong, as if it would have burst \n'
            'And fallen in showers.',
            ),
          actions: <Widget>[
            TextButton(
              child: const Text('Red Key'),
              onPressed: () {
                color = Colors.red.shade600;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Green Key'),
              onPressed: () {
                color = Colors.green.shade300;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Cyan Key'),
              onPressed: () {
                color = Colors.lightBlue.shade300;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Blue Key'),
              onPressed: () {
                color = Colors.blue.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Purple Key'),
              onPressed: () {
                color = Colors.purple.shade400;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Teal Key'),
              onPressed: () {
                color = Colors.teal.shade300;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Yellow Key'),
              onPressed: () {
                color = Colors.yellow.shade400;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Pink Key'),
              onPressed: () {
                color = Colors.pink.shade400;
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text('Navigation Dialog Screen - Afrizal')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}
