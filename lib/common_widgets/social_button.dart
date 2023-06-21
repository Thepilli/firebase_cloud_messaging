import 'package:firebase_cloud_messaging/common_widgets/button_loading_widget.dart';
import 'package:flutter/material.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton(
      {super.key,
      required this.text,
      required this.image,
      required this.foreground,
      required this.background,
      required this.onPressed,
      this.isLoading = false});

  final String text;
  final String image;
  final Color foreground;
  final Color background;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0, foregroundColor: foreground, backgroundColor: background, side: BorderSide.none),
        icon: isLoading ? SizedBox() : Image(image: AssetImage(image), width: 24, height: 24),
        label: isLoading
            ? ButtonLoadingWidget()
            : Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.apply(color: foreground),
              ),
      ),
    );
  }
}
