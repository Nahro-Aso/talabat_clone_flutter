import '../models/categories_model.dart';
import '../models/swiper_model.dart';
import '../models/top_picks_model.dart';

List<TopPicksModel> topPicksList() {
  List<TopPicksModel> list = [];
  list.add(
    TopPicksModel(
      title: "Past\nOrders",
      icon: "assets/icons/burger-pack.svg",
    ),
  );
  list.add(
    TopPicksModel(
      title: "Free\ndelivery",
      icon: "assets/icons/scooter-delivery.svg",
    ),
  );
  list.add(
    TopPicksModel(
      title: "Special\noffers",
      icon: "assets/icons/tags.svg",
    ),
  );
  list.add(
    TopPicksModel(
      title: "Desserts",
      icon: "assets/icons/dessert.svg",
    ),
  );
  list.add(
    TopPicksModel(
      title: "Burger\nLovers",
      icon: "assets/icons/burger-bag.svg",
    ),
  );
  list.add(
    TopPicksModel(
      title: "Pizz\nLovers",
      icon: "assets/icons/slice.svg",
    ),
  );
  return list;
}

List<CategoriesModel> categoriesList() {
  List<CategoriesModel> list = [];
  list.add(
    CategoriesModel(
      title: "Food",
      image: "assets/images/humburger.png",
      isNew: false,
    ),
  );
  list.add(
    CategoriesModel(
      title: "Coffee",
      image: "assets/images/coffee.png",
      isNew: true,
    ),
  );

  return list;
}

List<SwiperModel> swiperList() {
  List<SwiperModel> list = [];
  list.add(
    SwiperModel(
      image: "assets/images/dolores-preciado-Vu_fjfasu-4-unsplash.jpg",
    ),
  );
  list.add(
    SwiperModel(
      image: "assets/images/dolores-preciado-Vu_fjfasu-4-unsplash.jpg",
    ),
  );

  return list;
}
