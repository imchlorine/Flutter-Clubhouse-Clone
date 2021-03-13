import 'package:ClubHouseClone/share/shared_style.dart';
import 'package:flutter/cupertino.dart';

class GridIcon extends StatefulWidget {
  final Function onTap;
  const GridIcon({Key key, this.onTap}) : super(key: key);

  @override
  GridIconState createState() => GridIconState();
}

class GridIconState extends State<GridIcon> {
  bool showGridIcon;
  void changeState(value) {
    setState(() {
      showGridIcon = value;
    });
  }

  @override
  void initState() {
    super.initState();
    showGridIcon = true;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showGridIcon,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Icon(
          CupertinoIcons.square_grid_2x2_fill,
          color: brown,
        ),
      ),
    );
  }
}
