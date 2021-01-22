import 'package:flutter/material.dart';

class AnimateIcon extends StatefulWidget {
  @override
  _AnimateIconState createState() => _AnimateIconState();
}

class _AnimateIconState extends State<AnimateIcon> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Description',
            style: TextStyle(
              fontSize: 20,
            )),
        GestureDetector(
          onTap: () {
            setState(() {
              print('pressed');
              clicked = !clicked;
            });
          },
          child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 2),
              width: clicked ? 100.0 : 50.0,
              height: clicked ? 100.0 : 50.0,
              alignment:
                  clicked ? Alignment.center : AlignmentDirectional.topCenter,
              child: Icon(
                clicked ? Icons.favorite : Icons.favorite_border,
                size: clicked ? 50.0 : 30.0,
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}
