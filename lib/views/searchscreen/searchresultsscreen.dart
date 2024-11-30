import 'package:flutter/material.dart';
import 'package:news_app/models/homescreenmodel.dart';
import 'package:news_app/views/homescreen/widgets/latestnewscard.dart';
import 'package:news_app/views/newsdetailsscreen/newsdetailsscreen.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<News> results;

  const SearchResultsScreen({Key? key, required this.results})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Global',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              TextSpan(
                text: ' Express',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: results.isEmpty
          ? Center(child: Text('No results found'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final news = results[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Newsdetailsscreen(
                            image: news.urlToImage.toString(),
                            author: news.author.toString(),
                            title: news.title.toString(),
                            des: news.content.toString(),
                            time: news.publishedAt.toString(),
                          ),
                        ),
                      );
                    },
                    child: LatestNews(
                      image: news.urlToImage.toString(),
                      description: news.description.toString(),
                      author: news.author.toString(),
                      title: news.title.toString(),
                      // leading: news.urlToImage != null
                      //     ? Image.network(news.urlToImage!, width: 80, fit: BoxFit.cover)
                      //     : null,
                      // title: Text(news.title ?? 'No title'),
                      // subtitle: Text(news.description ?? 'No description'),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Newsdetailsscreen(
                      //         image: news.urlToImage.toString(),
                      //         author: news.author.toString(),
                      //         title: news.title.toString(),
                      //         des: news.content.toString(),
                      //         time: news.publishedAt.toString(),
                      //       ),
                      //     ),
                      //   );
                      // },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
