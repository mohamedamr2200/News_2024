import 'package:flutter/material.dart';
import '../../api_manager.dart';
import '../../model/NewsResponse.dart';
import '../../model/SourceResponse.dart';
import 'news_item.dart';

class NewsContainer extends StatelessWidget{
  Source source ;
  NewsContainer({required this.source});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future:ApiManager.getNews(source.id ?? '') ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                TextButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          else if (snapshot.data?.status != 'ok') {
            // server has code and message
            return Column(
              children: [
                Text('${snapshot.error}'),
                TextButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          } else {
            var newsList = snapshot.data?.articles ?? [];
            print(newsList.length);
            return ListView.builder(
                itemBuilder: (context , index){
                  return NewsItem(news: newsList[index]);
                },
              itemCount: newsList.length,
            );
          }
        }
    );
  }
}
