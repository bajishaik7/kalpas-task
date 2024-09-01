import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_kalpas/bloc/favorite_news_bloc/favorite_news_cubit.dart';
import 'package:task_kalpas/bloc/favorite_news_bloc/favorite_news_state.dart';
import 'package:task_kalpas/bloc/news_bloc/news_cubit.dart';
import 'package:task_kalpas/bloc/news_bloc/news_state.dart';
import 'package:task_kalpas/database/db_helper.dart';
import 'package:task_kalpas/database/favnews_model.dart';
import 'package:task_kalpas/model/news_model.dart';

import 'news_details_screen.dart';

class FavoriteNewsScreen extends StatefulWidget {
  const FavoriteNewsScreen({super.key});

  @override
  State<FavoriteNewsScreen> createState() => _FavoriteNewsScreenState();
}

class _FavoriteNewsScreenState extends State<FavoriteNewsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocProvider<FavNewsCubit>(
      create: (context) => FavNewsCubit()..getFavNewsData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<FavNewsCubit, favNewsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is favNewsStateSuccess) {
                List<FavNewsModel> favNewsList = state.favNewsList;
                return favNewsList.length != 0
                    ? ListView.builder(
                        itemCount: favNewsList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Slidable(
                            startActionPane:
                                ActionPane(motion: StretchMotion(), children: [
                              SlidableAction(
                                onPressed: (v) {
                                  context
                                      .read<FavNewsCubit>()
                                      .deleteFavNewsById(
                                          favNewsList[index].id!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Removed from favorites")));
                                },
                                icon: Icons.heart_broken,
                                backgroundColor: Colors.red.shade50,
                                label: "Remove from \n   favorites",
                                foregroundColor: Colors.red,
                              )
                            ]),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,PageTransition(child: NewsDetailsScreen(
                                          fromFav: true,
                                            imageUrl:favNewsList[index].imageUrl!=null?
                                                favNewsList[index].imageUrl!:"https://cdn.pixabay.com/photo/2013/07/13/12/09/sign-159285_960_720.png",
                                            title: favNewsList[index].title!,
                                            date:
                                               convertToDate(favNewsList[index].Date!),
                                            content:
                                                favNewsList[index].content!), type: PageTransitionType.rightToLeft)
                                   
                                 );
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 12 / width,
                                    vertical: height * 10 / height),
                                // height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 169, 189, 228),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Container(
                                            height: height * 100 / height,
                                            width: width * 100 / width,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                            ),
                                            child: Image.network(
                                              favNewsList[index].imageUrl != null
                                                  ? "${favNewsList[index].imageUrl}"
                                                  : "https://cdn.pixabay.com/photo/2013/07/13/12/09/sign-159285_960_720.png",
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Icon(Icons.broken_image,
                                                    size: 50, color: Colors.grey);
                                              },
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              context
                                                  .read<FavNewsCubit>()
                                                  .deleteFavNewsById(
                                                      favNewsList[index].id!);
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )),
                                      ],
                                    ),
                                    SizedBox(width: width * 8 / width),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 2,
                                            "${favNewsList[index].title}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: height * 3 / height,
                                          ),
                                          Text(
                                            "${favNewsList[index].content}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: height * 3 / height,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.calendar_month,
                                                  color: Colors.grey),
                                              SizedBox(
                                                width: width * 5 / width,
                                              ),
                                              Text(
                                                "${convertToDate(favNewsList[index].Date!)}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Column(
                        children: [
                          Lottie.asset("assets/images/nodata.json"),
                          Text(
                            "Slide Left to Add to favorited =>",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )); //
              }
              if (state is favNewsStateFailed) {
                return Center(
                    child: Column(
                  children: [
                    Lottie.asset("assets/images/nodata.json"),
                    Text(
                      "Slide Left to Add to favorites",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Slide Right to Remove from favorites",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ));
              }
              if (state is favNewsStateLoading) {
                return buildShimmerWidget();
              }
              return buildShimmerWidget();
            }),
      ),
    );
  }

  ///convert string to required format
  convertToDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    DateFormat formatter = DateFormat("EEE, dd MMM yyyy HH:mm 'GMT'");
    return formatter.format(dateTime.toUtc());
  }

  ///show shimmer while loading

  Widget buildShimmerWidget() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[200],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 14,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 14,
                          width: 100,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
