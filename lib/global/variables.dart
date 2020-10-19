import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

User firebaseuser;
FirebaseApp firebaseApp;

List<String> dummyImageLinks = [
  'https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j.jpg',
  'https://sarahfunky.com/wp-content/uploads/bb-plugin/cache/image-asset-panorama.jpeg',
  'https://www.wallpapers13.com/wp-content/uploads/2016/05/Cameroon-West-Africa-green-landscape-red-sky-sunset-Desktop-Wallpaper-full-screen-1680x1050.jpg ',
  'https://www.digitalphotomentor.com/photography/2014/04/sunset-white-balance-06.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYlxt-NGCMQ5yL8wVnn9FVcjOL1xGC6wUhxA&usqp=CAU',
  'https://images.unsplash.com/photo-1503949042290-cdd68d518962?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
  'https://us.123rf.com/450wm/grigory_bruev/grigory_bruev1509/grigory_bruev150900154/45289404-sky-bright-blue-orange-and-yellow-colors-sunset-instant-photo-toned-image-gradient-background.jpg?ver=6',
  'https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j.jpg',
  'https://i.gadgets360cdn.com/large/google_trusted_contacts_gp_1481270688477.jpg?downsize=950:*&output-quality=80&output-format=webp',
  'https://i.gadgets360cdn.com/large/samsung_galaxy_s20_plus_ultra_front_gadgets_360_1581447548079.jpg?downsize=950:*&output-quality=80&output-format=webp',
  'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202010/Screenshot_2020-04-28_at_2.04._1200x768.png?xUrx9XaTo31_8EUr1Wm2Ww66t7.PI61b&size=770:433',
  'https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/pubg_game_660_141020121948.jpg',
  'https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/flipkart_sale_660_131020032954.jpg',
  'https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/google_660_121020123600.jpg',
  'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202010/Sony_PS5_India_1200x768.png?I0bokud3Lzjyy5NYQ2HFzqQfuGIE.nFd&size=770:433',
  'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202010/Screenshot_2020-10-17_at_5.23._1200x768.png?W2zF6nuIJ5BQWSHdHTaJsuNpvnzYh8IH&size=770:433',
];

List<String> dummyVideoLinks = [
  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4?_=1',
  'https://player.vimeo.com/external/374176493.sd.mp4?s=c13d56141ab075639f96da8f3800b32b5f51bef6&profile_id=139&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/363012285.sd.mp4?s=f9f1082e164fa9ce78dba9beb858cae8afaa108c&profile_id=139&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/459124841.sd.mp4?s=367e9855780d54c05c257587aae710b7028add35&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/363013785.sd.mp4?s=1d1a3b39ad78af16c346cbff77895dd0f28ddc67&profile_id=139&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/314714772.sd.mp4?s=b3d92ace8cc000fb98770b2e59ade626f98ce642&profile_id=164&oauth2_token_id=57447761',
];
