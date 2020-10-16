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
];

List<String> dummyVideoLinks = [
  'https://player.vimeo.com/external/374176493.sd.mp4?s=c13d56141ab075639f96da8f3800b32b5f51bef6&profile_id=139&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/363012285.sd.mp4?s=f9f1082e164fa9ce78dba9beb858cae8afaa108c&profile_id=139&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/459124841.sd.mp4?s=367e9855780d54c05c257587aae710b7028add35&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/363013785.sd.mp4?s=1d1a3b39ad78af16c346cbff77895dd0f28ddc67&profile_id=139&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/297927806.sd.mp4?s=0f0a0de1d75bff9f84fa992d7a5253dedc4f35d6&profile_id=164&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/314714772.sd.mp4?s=b3d92ace8cc000fb98770b2e59ade626f98ce642&profile_id=164&oauth2_token_id=57447761',
];