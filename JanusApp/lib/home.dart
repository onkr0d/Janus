import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:janusapp/utilities.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState() : super();

  var status = true;
  var currentIcon = const Icon(Icons.add);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gaming Control Center"),
        ),
        body: LoaderOverlay(
            child: Material(
                child: Center(
                    child: CircleButton(
          onTap: () {
            setState(() {
              status = !status;
            });
            _sendUpdate(context);
          },
          onIcon: const Icon(Icons.add),
          offIcon: const Icon(Icons.remove),
          state: status,
        )))));
  }

  /// Send a status update to the server.
  ///
  /// Uses the variable [status] to update.
  /// Prevents interaction with the screen while running.
  void _sendUpdate(BuildContext context) async {
    context.loaderOverlay.show();
    var result = await Utilities.updateServerValue(status);
    var error = result != 200;
    Utilities.showBar(
        context,
        error
            ? 'Update failed. Error code: ' + result.toString()
            : 'Update successful, gaming is ' +
                (status ? 'enabled' : 'disabled'),
        error ? const Icon(Icons.error) : const Icon(Icons.check),
        error ? Colors.red : Colors.green);
    context.loaderOverlay.hide();
  }
}

/// A circle button with two different icons [onIcon], [offIcon] for each state,
/// and a callback [onTap].
class CircleButton extends StatefulWidget {
  final GestureTapCallback onTap;
  final Icon onIcon;
  final Icon offIcon;
  bool state;

  CircleButton(
      {Key? key,
      required this.onTap,
      required this.onIcon,
      required this.offIcon,
      required this.state})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircleButtonState();
  }
}

class _CircleButtonState extends State<CircleButton> {
  _CircleButtonState();

  @override
  Widget build(BuildContext context) {
    double size = 200.0;
    return InkWell(
        onTap: super.widget.onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: super.widget.state ? Colors.green : Colors.red,
              shape: BoxShape.circle),
          child:
              super.widget.state ? super.widget.onIcon : super.widget.offIcon,
        ),
        borderRadius: BorderRadius.circular(90),
        radius: 10);
  }
}
