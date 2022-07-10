
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home/home.dart';
import 'package:news_app/routes/routes.dart';
import 'package:news_app/screens/detail.dart';

import '../utils/api_request_status.dart';
import '../widgets/loading_widget.dart';

class Home extends StatelessWidget {
  final HomeController home;

  const Home(this.home, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      return home.apiRequestStatus.value == APIRequestStatus.loading ? const LoadingWidget(isImage: false,) :
      Scaffold(
        body: Container(
          color: const Color(0xffF2F5F9),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 70,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const Text("Hi Guest,", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24
                  ),)
              ),
              const Gap(16),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: home.dataNews.value.articles?.length??0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = home.dataNews.value.articles![index];
                  return Container(
                    color: Colors.white70,
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print("tap");
                        }
                        Get.toNamed(Routes.detail, arguments: data);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            elevation: 4,
                            child: ClipRRect(

                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              child: Hero(
                                tag: data.urlToImage.toString(),
                                child: CachedNetworkImage(
                                  imageUrl: data.urlToImage.toString(),
                                  placeholder: (context, url) => SizedBox(
                                    width: ScreenUtil().setWidth(250),
                                    child: const LoadingWidget(
                                      isImage: true,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                  height: 100.h,
                                  width: 80.h,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Hero(
                                  tag: data.title.toString(),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      data.title.toString(),
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Hero(
                                  tag: data.author.toString(),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      data.author.toString(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Hero(
                                  tag: data.publishedAt.toString(),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      data.publishedAt.toString(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });

  }
}