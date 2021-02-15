import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SnowAnimation extends StatefulWidget {
  SnowAnimation(this.animType);

  final String animType;

  @override
  _SnowAnimationState createState() => _SnowAnimationState();
}

class _SnowAnimationState extends State<SnowAnimation> {
  Artboard _artboard;
  final fileName = 'assets/rive/home.riv';

  @override
  void initState() {
    _loadAnimation();
    super.initState();
  }

  void _loadAnimation() async {
    final bytes = await rootBundle.load(fileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      setState(() {
        _artboard = file.mainArtboard
          ..addController(SimpleAnimation(widget.animType));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
        height: mediaHeight * 0.40,
        child: _artboard != null
            ? Rive(
                artboard: _artboard,
              )
            : Container(),
      ),
    );
  }
}
