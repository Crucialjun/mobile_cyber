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
        appBar: AppBar(
          toolbarHeight: 48.h,
          leading: ExtendedImage.network(
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
              } else if (state.extendedImageLoadState == LoadState.failed) {
                return const Center(
                  child: Icon(Icons.error),
                );
              }
              return null;
            },
          ),
          title: Row(
            children: [
              const Text("Hey, "),
              Text(user.username == "" ? "User" : user.username,
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  "Which service can we help you with today?",
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search for a service",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 4.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Chip(
                        backgroundColor: Colors.grey[600],
                        label: Text("Service $index"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
