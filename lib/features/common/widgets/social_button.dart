import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_cyber/utils/constants.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String asset;
  const SocialButton({
    super.key,
    required this.text,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: textFieldBackground),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                SvgPicture.asset(asset, height: 36),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
