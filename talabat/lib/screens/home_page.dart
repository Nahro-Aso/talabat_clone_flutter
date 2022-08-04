import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talabat/constants/app_colors.dart';
import 'package:talabat/models/categories_model.dart';
import 'package:talabat/models/swiper_model.dart';
import 'package:talabat/models/top_picks_model.dart';

import '../utlis/data_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categories = categoriesList();
    List<TopPicksModel> topPicks = topPicksList();
    List<SwiperModel> swipers = swiperList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const Appbar(),
          CategoriesSection(categories: categories),
          TopPicksSection(topPicks: topPicks),
          SwiperSection(swipers: swipers)
        ],
      ),
    );
  }
}

class SwiperSection extends StatelessWidget {
  const SwiperSection({
    Key? key,
    required this.swipers,
  }) : super(key: key);

  final List<SwiperModel> swipers;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
          child: SizedBox(
        height: 200,
        child: Swiper(
          pagination: const SwiperPagination(builder: SwiperPagination.dots),
          outer: true,
          autoplay: true,
          itemCount: swipers.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                swipers[index].image,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      )),
    );
  }
}

class TopPicksSection extends StatelessWidget {
  const TopPicksSection({
    Key? key,
    required this.topPicks,
  }) : super(key: key);

  final List<TopPicksModel> topPicks;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Top Picks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                    itemCount: topPicks.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primary.withOpacity(0.1),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                topPicks[index].icon,
                                height: 40,
                                color: AppColors.primary,
                              )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              topPicks[index].title,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ]),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hey, Good morning",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 140,
            child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: const Color(0xffff5f5f5f5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(children: [
                    Positioned(
                        child: Column(
                      children: [
                        Text(
                          categories[index].title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        categories[index].isNew
                            ? Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primary),
                                child: const Text("New",
                                    style: TextStyle(color: Colors.white)))
                            : const SizedBox()
                      ],
                    )),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          categories[index].image,
                          height: 100,
                          width: 100,
                        ))
                  ]),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primary.withOpacity(0.2),
      pinned: true,
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery to",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
            ),
            Row(
              children: [
                const Text(
                  "(Ashti, Ashti Street)",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  "assets/icons/dropdown.svg",
                  color: AppColors.primary,
                  height: 20,
                )
              ],
            )
          ]),
    );
  }
}
