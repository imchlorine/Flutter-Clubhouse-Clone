import 'package:ClubHouseClone/share/shared_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAdd extends StatelessWidget {
  final String imageUrl;
  final double size;
  const IconAdd({
    Key key,
    @required this.imageUrl,
    this.size = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: size * 1.05,
              width: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size / 2.1),
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: size / 2.5 > 18 ? 0 : 2,
            bottom: size / 2.5 > 18 ? 0 : 2,
            child: Container(
              alignment: Alignment.center,
              height: size / 2.5,
              width: size / 2.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeColor,
              ),
              child: Icon(Icons.add_circle_rounded,
                  color: indigo, size: size / 2.5),
            ),
          ),
        ],
      ),
    );
  }
}
