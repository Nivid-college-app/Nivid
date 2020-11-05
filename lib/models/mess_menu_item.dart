import 'package:flutter/foundation.dart';

enum FoodTime { Breakfast, Lunch, Dinner }

String toValueString(FoodTime type) {
  switch (type) {
    case FoodTime.Breakfast:
      return 'BREAKFAST';
    case FoodTime.Lunch:
      return 'LUNCH';
    case FoodTime.Dinner:
      return 'DINNER';
    default:
      return null;
  }
}

FoodTime toEnum(String type) {
  switch (type) {
    case 'BREAKFAST':
      return FoodTime.Breakfast;
    case 'LUNCH':
      return FoodTime.Lunch;
    case 'DINNER':
      return FoodTime.Dinner;
    default:
      return null;
  }
}

class MessMenuItem {
  String id;
  String foodName;
  FoodTime time;
  List<int> listOfDays;
  String imageLink;
  double rating;

  MessMenuItem(
      {@required this.id,
      @required this.foodName,
      @required this.time,
      @required this.listOfDays,
      @required this.imageLink,
      this.rating = 0});

  MessMenuItem.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.foodName = doc['fn'];
    this.time = doc['tm'];
    this.listOfDays = [...doc['lod']];
    this.imageLink = doc['imgLnk'];
    this.rating = doc['rtng'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'fn': this.foodName,
        'tm': toValueString(this.time),
        'lod': this.listOfDays,
        'imgLnk': this.imageLink,
        'rtng': this.rating,
      };
}

List<MessMenuItem> getSelectedTimeFood(
    List<MessMenuItem> list, FoodTime time, int day) {
  return list
      .where(
          (element) => element.time == time && element.listOfDays.contains(day))
      .toList();
}

List<MessMenuItem> messMenuItems = [
  MessMenuItem(
      id: '1',
      foodName: 'Aloo paratha',
      time: FoodTime.Breakfast,
      listOfDays: [0],
      imageLink:
          'https://punampaul.com/wp-content/uploads/2018/05/Aloo-Paratha.jpg',
      rating: 3.5),
  MessMenuItem(
      id: '2',
      foodName: 'tomato chutney',
      time: FoodTime.Breakfast,
      listOfDays: [0],
      imageLink:
          'https://thumbs.dreamstime.com/b/indain-tomato-chutney-37439769.jpg',
      rating: 4.1),
  MessMenuItem(
      id: '3',
      foodName: 'Bread',
      time: FoodTime.Breakfast,
      listOfDays: [0, 1, 2, 3, 4, 5, 6],
      imageLink:
          'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/16:9/w_1200,c_limit/milk-bread.jpg',
      rating: 4.5),
  MessMenuItem(
      id: '4',
      foodName: 'Jam',
      time: FoodTime.Breakfast,
      listOfDays: [0, 1, 2, 3, 4, 5, 6],
      imageLink:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Strawberry_jam_on_a_dish.JPG/1200px-Strawberry_jam_on_a_dish.JPG',
      rating: 4.3),
  MessMenuItem(
      id: '5',
      foodName: 'Butter',
      time: FoodTime.Breakfast,
      listOfDays: [0, 1, 2, 3, 4, 5, 6],
      imageLink:
          'https://www.littledairyontheprairie.com/wp-content/uploads/2020/01/real-whipped-butter-11-500x500.jpg',
      rating: 3.7),
  MessMenuItem(
      id: '6',
      foodName: 'Curd',
      time: FoodTime.Breakfast,
      listOfDays: [0],
      imageLink:
          'https://4.imimg.com/data4/BJ/ES/ANDROID-52064905/product-500x500.jpeg',
      rating: 4.7),
  MessMenuItem(
      id: '7',
      foodName: 'Banana',
      time: FoodTime.Breakfast,
      listOfDays: [0, 6],
      imageLink:
          'https://m.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/05/18/Pictures/_cdbf52fa-5a63-11e8-b431-73159b4b09e2.jpg',
      rating: 5),
  MessMenuItem(
      id: '8',
      foodName: 'tea',
      time: FoodTime.Breakfast,
      listOfDays: [0, 3, 5],
      imageLink:
          'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/05/pjimage-6-1590064882.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '9',
      foodName: 'Coffee',
      time: FoodTime.Breakfast,
      listOfDays: [1, 2, 4, 6],
      imageLink:
          'https://www.cancer.org/content/dam/cancer-org/images/photographs/single-use/espresso-coffee-cup-with-beans-on-table-restricted.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '10',
      foodName: 'Noodles',
      time: FoodTime.Breakfast,
      listOfDays: [1],
      imageLink:
          'https://www.loveandoliveoil.com/wp-content/uploads/2015/03/soy-sauce-noodlesH2.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '11',
      foodName: 'Medu vada',
      time: FoodTime.Breakfast,
      listOfDays: [1],
      imageLink:
          'https://www.archanaskitchen.com/images/archanaskitchen/Indian_Breakfast_Tiffins/South_Indian_Medu_Vada_Sambar_with_Medu_Vada_Maker-8_400.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '12',
      foodName: 'Groundnut chutney',
      time: FoodTime.Breakfast,
      listOfDays: [1, 2, 3],
      imageLink:
          'https://www.nammaneootatindi.com/wp-content/uploads/2018/11/groundnutChutney-600x414.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '13',
      foodName: 'Tomato sauce',
      time: FoodTime.Breakfast,
      listOfDays: [1],
      imageLink:
          'https://igashop.com.au/wp-content/uploads/2020/05/masterfoods-tomato-sauce-500ml.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '14',
      foodName: 'Masala idly',
      time: FoodTime.Breakfast,
      listOfDays: [2],
      imageLink:
          'https://www.dwarakaorganic.com/wp-content/uploads/2012/06/Masala-Idli.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '15',
      foodName: 'Sambar',
      time: FoodTime.Breakfast,
      listOfDays: [2],
      imageLink:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2018/10/sambar-recipe-1a.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '16',
      foodName: 'Boiled egg',
      time: FoodTime.Breakfast,
      listOfDays: [2, 5],
      imageLink:
          'https://cdn1.tmbi.com/TOH/Images/Photos/37/575x575/exps29222_W101973175C05_17_2bC_WEB.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '17',
      foodName: 'Aloo bonda',
      time: FoodTime.Breakfast,
      listOfDays: [3],
      imageLink:
          'https://2.imimg.com/data2/RA/KB/MY-2942467/aloo-bonda-500x500.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '19',
      foodName: 'Pav bhaji',
      time: FoodTime.Breakfast,
      listOfDays: [6],
      imageLink:
          'https://www.shanazrafiq.com/wp-content/uploads/2019/01/Pav-Bhaji-7.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '21',
      foodName: 'Chole masala',
      time: FoodTime.Lunch,
      listOfDays: [1, 5],
      imageLink:
          'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chana-masala-fb809bc.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '22',
      foodName: 'Sambar',
      time: FoodTime.Lunch,
      listOfDays: [0, 4, 5],
      imageLink:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2018/10/sambar-recipe-1a.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '23',
      foodName: 'Drumstick curry',
      time: FoodTime.Lunch,
      listOfDays: [0],
      imageLink:
          'https://indianhealthyrecipes.com/wp-content/uploads/2013/02/drumstick-tomato-curry-recipe.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '24',
      foodName: 'Puri',
      time: FoodTime.Lunch,
      listOfDays: [0, 5],
      imageLink:
          'https://i.ndtvimg.com/i/2016-04/poori_625x350_41460704245.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '25',
      foodName: 'Salad',
      time: FoodTime.Lunch,
      listOfDays: [0, 2, 3, 4, 5, 6],
      imageLink:
          'https://ifoodreal.com/wp-content/uploads/2018/06/FG-corn-avocado-salad.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '26',
      foodName: 'Rice',
      time: FoodTime.Lunch,
      listOfDays: [0, 2, 3, 5],
      imageLink:
          'https://food.fnr.sndimg.com/content/dam/images/food/video/0/01/012/0129/0129416.jpg.rend.hgtvcom.826.620.suffix/1481334864898.jpeg',
      rating: 4.7),
  MessMenuItem(
      id: '27',
      foodName: 'Curd',
      time: FoodTime.Lunch,
      listOfDays: [0, 1, 2, 3, 4],
      imageLink:
          'https://4.imimg.com/data4/BJ/ES/ANDROID-52064905/product-500x500.jpeg',
      rating: 4.7),
  MessMenuItem(
      id: '28',
      foodName: 'Roti',
      time: FoodTime.Lunch,
      listOfDays: [1, 2, 3, 4],
      imageLink:
          'https://www.bigbasket.com/media/uploads/recipe/w-l/2712_1_1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '29',
      foodName: 'Kadai Panner',
      time: FoodTime.Lunch,
      listOfDays: [2],
      imageLink: 'https://www.ndtv.com/cooks/images/kadhai%20paneer.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '30',
      foodName: 'Fried dal',
      time: FoodTime.Lunch,
      listOfDays: [1, 3],
      imageLink:
          'https://4.bp.blogspot.com/-xHrMGBPXofg/VmhDhF08VyI/AAAAAAAAHQ4/tvrE54y9Qlc/s1600/Mixed%2Bdal%2Bfry.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '31',
      foodName: 'Egg fried rice',
      time: FoodTime.Lunch,
      listOfDays: [1, 3],
      imageLink:
          'https://www.whiskaffair.com/wp-content/uploads/2017/11/Schezwan-Egg-Fried-Rice-3-500x500.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '31',
      foodName: 'Veg fried rice',
      time: FoodTime.Lunch,
      listOfDays: [1, 3],
      imageLink:
          'https://punampaul.com/wp-content/uploads/2019/07/Veg-Fried-Rice.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '32',
      foodName: 'Veg kohfta',
      time: FoodTime.Lunch,
      listOfDays: [1],
      imageLink:
          'https://holycowvegan.net/wp-content/uploads/2020/01/vegan-malai-kofta-indian-cream-dumplings-tomato-onion-sauce-2-1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '33',
      foodName: 'Chicken masala',
      time: FoodTime.Lunch,
      listOfDays: [2],
      imageLink: null,
      rating: 4.7),
  MessMenuItem(
      id: '34',
      foodName: 'Punjabi tadka dal',
      time: FoodTime.Lunch,
      listOfDays: [2, 4],
      imageLink:
          'https://www.whiskaffair.com/wp-content/uploads/2018/01/Dal-tadka-4.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '35',
      foodName: 'Rajma masala',
      time: FoodTime.Lunch,
      listOfDays: [3],
      imageLink:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2019/01/rajma-recipe-1a.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '36',
      foodName: 'Egg fried masala',
      time: FoodTime.Lunch,
      listOfDays: [3],
      imageLink:
          'https://media.chefdehome.com/750/0/0/masalaeggcurry/masalaeggcurry_main1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '37',
      foodName: 'Rasam',
      time: FoodTime.Lunch,
      listOfDays: [3],
      imageLink:
          'https://www.karnataka.com/wp-content/uploads/2020/04/800px-Rasam_-_1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '38',
      foodName: 'Kadi pakooda',
      time: FoodTime.Lunch,
      listOfDays: [4],
      imageLink:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2012/01/punjabi-kadhi-pakora-recipe-1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '39',
      foodName: 'Veg manchurian',
      time: FoodTime.Lunch,
      listOfDays: [4],
      imageLink:
          'https://www.awesomecuisine.com/wp-content/uploads/2018/07/cabbage_manchurian_dry-500x500.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '40',
      foodName: 'Papad',
      time: FoodTime.Lunch,
      listOfDays: [2, 4, 6],
      imageLink:
          'https://5.imimg.com/data5/PC/BR/MY-44522155/moong-doted-papad-500x500.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '41',
      foodName: 'Chole masala',
      time: FoodTime.Lunch,
      listOfDays: [5],
      imageLink:
          'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chana-masala-fb809bc.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '42',
      foodName: 'Chana dal',
      time: FoodTime.Lunch,
      listOfDays: [5],
      imageLink:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2013/03/chana-dal-recipe-1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '43',
      foodName: 'Hyderabadi chicken dum biryani',
      time: FoodTime.Lunch,
      listOfDays: [6],
      imageLink:
          'https://i.pinimg.com/originals/2c/ca/d5/2ccad553273808b29d4b05573eb5b7cb.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '44',
      foodName: 'Paneer biryani',
      time: FoodTime.Lunch,
      listOfDays: [6],
      imageLink:
          'https://i.pinimg.com/564x/05/b3/5d/05b35d160eac9e2abce0dd194ff00a3c.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '45',
      foodName: 'Raita',
      time: FoodTime.Lunch,
      listOfDays: [5, 6],
      imageLink:
          'https://www.manusmenu.com/wp-content/uploads/2013/02/Raita-1-1-of-1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '46',
      foodName: 'Veg kohfta',
      time: FoodTime.Dinner,
      listOfDays: [0],
      imageLink:
          'https://holycowvegan.net/wp-content/uploads/2020/01/vegan-malai-kofta-indian-cream-dumplings-tomato-onion-sauce-2-1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '47',
      foodName: 'Egg bhurji',
      time: FoodTime.Dinner,
      listOfDays: [0, 5],
      imageLink:
          'https://www.whiskaffair.com/wp-content/uploads/2019/10/Egg-Bhurji-1-3-500x375.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '48',
      foodName: 'Sambar',
      time: FoodTime.Dinner,
      listOfDays: [0, 1, 2],
      imageLink:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2018/10/sambar-recipe-1a.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '49',
      foodName: 'Salad',
      time: FoodTime.Dinner,
      listOfDays: [0, 1, 2, 3, 4, 5, 6],
      imageLink:
          'https://ifoodreal.com/wp-content/uploads/2018/06/FG-corn-avocado-salad.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '50',
      foodName: 'Rice',
      time: FoodTime.Dinner,
      listOfDays: [0, 1, 4, 5, 6],
      imageLink:
          'https://food.fnr.sndimg.com/content/dam/images/food/video/0/01/012/0129/0129416.jpg.rend.hgtvcom.826.620.suffix/1481334864898.jpeg',
      rating: 4.7),
  MessMenuItem(
      id: '51',
      foodName: 'Roti',
      time: FoodTime.Dinner,
      listOfDays: [1, 2, 3, 5, 6],
      imageLink:
          'https://www.bigbasket.com/media/uploads/recipe/w-l/2712_1_1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '52',
      foodName: 'Munchurian',
      time: FoodTime.Dinner,
      listOfDays: [1],
      imageLink:
          'https://www.awesomecuisine.com/wp-content/uploads/2018/07/cabbage_manchurian_dry-500x500.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '53',
      foodName: 'Curd',
      time: FoodTime.Dinner,
      listOfDays: [1, 2, 4, 5, 6],
      imageLink:
          'https://4.imimg.com/data4/BJ/ES/ANDROID-52064905/product-500x500.jpeg',
      rating: 4.7),
  MessMenuItem(
      id: '54',
      foodName: 'Green peas masala',
      time: FoodTime.Dinner,
      listOfDays: [1],
      imageLink:
          'https://cdn.statically.io/img/www.flavourstreat.com/f=auto/wp-content/uploads/2019/06/indian-green-peas-curry-recipe-500x500.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '55',
      foodName: 'Veg fried rice',
      time: FoodTime.Dinner,
      listOfDays: [2, 3],
      imageLink:
          'https://punampaul.com/wp-content/uploads/2019/07/Veg-Fried-Rice.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '56',
      foodName: 'Aloo gobi',
      time: FoodTime.Dinner,
      listOfDays: [2, 3, 5],
      imageLink:
          'https://www.whiskaffair.com/wp-content/uploads/2019/09/Aloo-Gobi-1-3.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '57',
      foodName: 'Mushroom peas curry',
      time: FoodTime.Dinner,
      listOfDays: [3, 6],
      imageLink:
          'https://img1.exportersindia.com/product_images/bc-full/dir_180/5372012/mushroom-matar-1512994138-3513214.jpeg',
      rating: 4.7),
  MessMenuItem(
      id: '58',
      foodName: 'Raita',
      time: FoodTime.Dinner,
      listOfDays: [3],
      imageLink:
          'https://www.manusmenu.com/wp-content/uploads/2013/02/Raita-1-1-of-1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '59',
      foodName: 'Fried dal',
      time: FoodTime.Dinner,
      listOfDays: [4],
      imageLink:
          'https://4.bp.blogspot.com/-xHrMGBPXofg/VmhDhF08VyI/AAAAAAAAHQ4/tvrE54y9Qlc/s1600/Mixed%2Bdal%2Bfry.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '60',
      foodName: 'Cauliflower 65',
      time: FoodTime.Dinner,
      listOfDays: [2],
      imageLink:
          'https://c.ndtvimg.com/2019-09/lokfu1oo_gobi_625x300_06_September_19.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '61',
      foodName: 'Kerala parota',
      time: FoodTime.Dinner,
      listOfDays: [4],
      imageLink:
          'https://farm9.staticflickr.com/8586/16023214373_90552b64f6_o.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '62',
      foodName: 'Kadai chicken',
      time: FoodTime.Dinner,
      listOfDays: [4],
      imageLink:
          'https://myheartbeets.com/wp-content/uploads/2014/05/kadai-chicken-recipe.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '63',
      foodName: 'Rasam',
      time: FoodTime.Dinner,
      listOfDays: [4, 5, 6],
      imageLink:
          'https://www.karnataka.com/wp-content/uploads/2020/04/800px-Rasam_-_1.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '64',
      foodName: 'Carrot fry',
      time: FoodTime.Dinner,
      listOfDays: [6],
      imageLink: 'https://i.ytimg.com/vi/kKzfa1AdkxE/maxresdefault.jpg',
      rating: 4.7),
  MessMenuItem(
      id: '65',
      foodName: 'Tomato curry',
      time: FoodTime.Dinner,
      listOfDays: [3, 6],
      imageLink: 'https://i.ytimg.com/vi/6d064RiWVJM/maxresdefault.jpg',
      rating: 4.7),
];
