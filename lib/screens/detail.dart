import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/models/allNewsData.dart';

import 'package:news_app/modules/detail/detail.dart';

import '../widgets/description_text.dart';
import '../widgets/loading_widget.dart';

class Detail extends StatelessWidget {
  final DetailController detail;

  const Detail(this.detail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: <Widget>[
          SizedBox(height: 10.h),
          _buildImageTitleSection(detail.entry),
          SizedBox(height: 15.h),
          _buildSectionTitle("Deskripsi"),
          _buildDivider(),
          SizedBox(height: 15.h),
          Text(
              (detail.entry.description.toString())
                .replaceAll(r'\n', '\n')
                .replaceAll(r'\r', '')
                .replaceAll(r"\'", "'"),
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    ));
  }



  _buildDivider() {
    return const Divider(
      color: Colors.blueGrey,
    );
  }

  _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildImageTitleSection(Articles detail) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: detail.urlToImage.toString(),
            child: CachedNetworkImage(
              imageUrl: detail.urlToImage.toString(),
              placeholder: (context, url) => Container(
                child: const LoadingWidget(),
              ),
              fit: BoxFit.fill,
              height: 100.h,
              width: 80.w,
            ),
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.h),
                Hero(
                  tag: detail.title.toString(),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      detail.title.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Hero(
                  tag: detail.author.toString(),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      detail.author.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Hero(
                  tag: detail.publishedAt.toString(),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      detail.publishedAt.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}