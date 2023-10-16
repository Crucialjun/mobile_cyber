import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_cyber/common/models/app_user.dart';

class HomePageScreen extends StatelessWidget {
  static const String routeName = "home_page_screen";

  final AppUser user;
  const HomePageScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                ExtendedImage.network(
                  user.photoUrl,
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.cover,
                  shape: BoxShape.circle,
                  cache: true,
                  enableMemoryCache: true,
                  loadStateChanged: (state) {
                    if (state.extendedImageLoadState == LoadState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.extendedImageLoadState ==
                        LoadState.failed) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }
                    return null;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome,"),
                    Text(user.username == "" ? "User" : user.username),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Icon(Icons.notifications)
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Which service would you like to request today?",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}
