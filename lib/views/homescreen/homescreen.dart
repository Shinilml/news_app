import 'package:flutter/material.dart';
import 'package:news_app/controller/homescreencontroller.dart';
import 'package:news_app/utils/colorconstants.dart';
import 'package:news_app/views/homescreen/widgets/latestnewscard.dart';
import 'package:news_app/views/newsdetailsscreen/newsdetailsscreen.dart';
import 'package:news_app/views/searchscreen/searchresultsscreen.dart';

import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List catlist = [
    "general",
    "business",
    "sports",
    "entertainment",
    "science",
    "technology"
  ];

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = context.read<NewsScreenController>();
      controller.getData();
      controller.getcatdata(catlist[selectedCategoryIndex]);
      controller.searchNews("test query").then((results) {
        print("Test query results: ${results.length}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
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
        actions: [Icon(Icons.notifications)],
      ),
      body: Consumer<NewsScreenController>(
        builder: (context, controller, child) {
          if (controller.isLoading && controller.isCategoryLoading == false) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome,",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Explore the world by one click",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onSubmitted: (query) async {
                      if (query.isNotEmpty) {
                        final searchResults = await context
                            .read<NewsScreenController>()
                            .searchNews(query);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchResultsScreen(results: searchResults),
                          ),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorConstants.grey,
                      ),
                      hintText: "Search for news",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: ColorConstants.grey,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Latest News",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  latestnewssection(controller),
                  SizedBox(height: 20),
                  categorylistrowsection(controller),
                  SizedBox(height: 20),
                  categorynewssection(controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox latestnewssection(NewsScreenController controller) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.latestNewsList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Newsdetailsscreen(
                    image:
                        controller.latestNewsList[index].urlToImage.toString(),
                    author: controller.latestNewsList[index].author.toString(),
                    title: controller.latestNewsList[index].title.toString(),
                    des: controller.latestNewsList[index].content.toString(),
                    time:
                        controller.latestNewsList[index].publishedAt.toString(),
                  ),
                ));
          },
          child: LatestNews(
            author: controller.latestNewsList[index].author.toString(),
            image: controller.latestNewsList[index].urlToImage.toString(),
            title: controller.latestNewsList[index].title.toString(),
            description:
                controller.latestNewsList[index].description.toString(),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }

  SingleChildScrollView categorylistrowsection(
      NewsScreenController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          catlist.length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
              controller.getcatdata(catlist[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedCategoryIndex == index
                    ? ColorConstants.black
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                catlist[index],
                style: TextStyle(
                  color: selectedCategoryIndex == index
                      ? ColorConstants.white
                      : ColorConstants.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox categorynewssection(NewsScreenController controller) {
    return SizedBox(
      child: controller.isCategoryLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categoryNewsList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Newsdetailsscreen(
                          image: controller.categoryNewsList[index].urlToImage
                              .toString(),
                          author: controller.categoryNewsList[index].author
                              .toString(),
                          title: controller.categoryNewsList[index].title
                              .toString(),
                          des: controller.categoryNewsList[index].content
                              .toString(),
                          time: controller.categoryNewsList[index].publishedAt
                              .toString(),
                        ),
                      ));
                },
                child: LatestNews(
                  author: controller.categoryNewsList[index].author.toString(),
                  title: controller.categoryNewsList[index].title.toString(),
                  description:
                      controller.categoryNewsList[index].description.toString(),
                  image:
                      controller.categoryNewsList[index].urlToImage.toString(),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
    );
  }
}
