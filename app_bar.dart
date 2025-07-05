import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class appbar_page extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String imagenetwork;

  appbar_page({
    required this.imagenetwork,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SizedBox(
        height: preferredSize.height,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  imagenetwork,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.5),
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 90),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/f/fd/Netflix-Logo.png')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
