import 'package:Nivid/global/variables.dart';
import 'package:flutter/foundation.dart';

enum NewsType {
  General,
  Technical,
  Social,
}

String toValueString(NewsType type) {
  switch (type) {
    case NewsType.General:
      return 'GENERAL';
    case NewsType.Technical:
      return 'TECHNICAL';
    case NewsType.Social:
      return 'SOCIAL';
    default:
      return null;
  }
}

NewsType toEnum(String type) {
  switch (type) {
    case 'GENERAL':
      return NewsType.General;
    case 'TECHNICAL':
      return NewsType.Technical;
    case 'SOCIAL':
      return NewsType.Social;
    default:
      return null;
  }
}

class NewsFeed {
  String id;
  String uid;
  String userImageLink;
  String userName;
  String downloadLink;
  String headLine;
  String description;
  bool isVideo;
  NewsType type;
  DateTime timePosted;

  NewsFeed({
    @required this.id,
    @required this.uid,
    @required this.userImageLink,
    @required this.userName,
    @required this.downloadLink,
    this.isVideo = false,
    @required this.headLine,
    @required this.description,
    @required this.type,
    @required this.timePosted,
  });

  NewsFeed.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.uid = doc['uid'];
    this.userImageLink = doc['uil'];
    this.userName = doc['usrnm'];
    this.downloadLink = doc['dllnk'];
    this.isVideo = doc['isVid'];
    this.headLine = doc['hdln'];
    this.description = doc['desc'];
    this.type = toEnum(doc['type']);
    this.timePosted = doc['tp']?.toDate();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'uid': this.uid,
        'uil': this.userImageLink,
        'usrnm': this.userName,
        'dllnk': this.downloadLink,
        'isVid': this.isVideo,
        'hdln': this.headLine,
        'desc': this.description,
        'type': toValueString(this.type),
        'tp': this.timePosted,
      };
}

List<NewsFeed> newsfeeds = [
  NewsFeed(
      id: '1',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(8),
      headLine:
          'Google Trusted Contacts Officially Pulled From App Stores, Support to Stop After December 1',
      description:
          'Google has officially pulled the plug on its Trusted Contacts app. First introduced in 2016, the app offered users a way to share their device activity status and location with selected contacts. It has now disappeared from both Google Play store and the Apple\'s App Store. The tech giant will also stop support for the app starting December 1 this year. The move follows a series of measures that Google has taken recently to optimise its products and services. Trusted Contacts follows in the footsteps of Google\'s two other location sharing apps — Google Latitude and Google+ Location Sharing — that were scrapped earlier.\nTrusted Contacts was first inducted exclusively to Play Store for Android users. A year and some upgrades later, it was made available for iOS users via the App Store. By then, it was integrated with Google Maps and offered useful features like allowing a trusted contact to be added via email address. But it slowly lost its sheen.\nFor those who have the Trusted Contacts app installed still, Google will end support to it after December 1. The website has put up a notice that announces the date. Google is prompting the users to use location sharing feature, that now also includes live location — a functionality of trusted contacts — on Google Maps instead. Users who wish to download a list of their trusted contacts also have till December 1 to do it from the website.\nhttps://gadgets.ndtv.com/apps/news/google-contacts-app-removed-play-store-apple-support-stop-last-date-december-1-maps-2311682',
      type: NewsType.General,
      timePosted: DateTime.now()),
  NewsFeed(
      id: '2',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(9),
      headLine:
          'Samsung Galaxy S21 Launch May Take Place in Early January, Production Said to Begin Late This Year',
      description:
          'Samsung Galaxy S21, the next-generation flagship from the South Korean giant, is said to arrive as early as January next year. The reported schedule is ahead of the company\'s traditional February or March launch for the Galaxy S phones. The Galaxy S21 launch could reportedly take place sometime in early January. Samsung is also reportedly planning to kick off production for its Galaxy S21 flagship in December – a month earlier than the Galaxy S20 manufacturing that began back in January this year.\nCiting sources familiar with the development, SamMobile reports that the Samsung Galaxy S21 launch will be held in early January 2021. One of the speculated reasons behind the early launch is to capitalise on the absence of Huawei. The January release may also give Samsung some time to make preparations for a separate launch of its new foldable phone later.\nAccording to a separate report by TheElec, Samsung would begin the production of its Galaxy S21 series in December and kick off its sale “a month sooner than its predecessors.\”\nThe Galaxy S20 series went on sale on March 6. This suggests that the Galaxy S21 models could debut as soon as February 5 next year. SamMobile also speculates that the Galaxy S21 could go on sale either in late January or in early February.\nAlongside the Samsung Galaxy S21, you can expect the Galaxy Buds 2 launch at the Galaxy Unpacked 2021 event early next year. TheElec reports that the new wireless earbuds, codenamed Attic, will come with upgraded water resistance that would be better than the original Galaxy Buds as well as the Galaxy Buds+ and Galaxy Buds Live.\nSamsung Galaxy S21 specifications (expected)\nThe Galaxy S21 series is said to have three distinct models that are internally being called O1, P3, and T2, according to the TheElec. These could be the Galaxy S21, Galaxy S21+, and the Galaxy S21 Ultra. The Galaxy S21 Ultra may have S Pen support, as per a previous report.\nFurther, TheElec report mentions that the new models in the Galaxy S21 family will come in five distinct colour options – Grey, Pink, Silver, Violet, and White. Galaxy Buds 2, on the other hand, are said to come in Black, Silver, and Violet colour options.\nAt least one of the models in the Galaxy S21 series is speculated to feature an under-display selfie camera along with optical image stabilisation (OIS) support. The new top-end phone in the company\'s Galaxy lineup is also likely to have up to 25W fast charging support.\nIs this the end of the Samsung Galaxy Note series as we know it? We discussed this on Orbital, our weekly technology podcast, which you can subscribe to via Apple Podcasts, Google Podcasts, or RSS, download the episode, or just hit the play button below.',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(minutes: 1))),
  NewsFeed(
      id: '2',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyVideoLinks.elementAt(3),
      isVideo: true,
      headLine:
          'Exercise and yoga keeps you fit and healthy, Here are some tips.',
      description:
          'Yoga as exercise is a physical activity consisting mainly of postures, often connected by flowing sequences, sometimes accompanied by breathing exercises, and frequently ending with relaxation lying down or meditation. Yoga in this form has become familiar across the world, especially in America and Europe. It is derived from the postures used in the medieval spiritual discipline of Haṭha yoga, but it is generally simply called "yoga". Academics have given yoga as exercise a variety of names, including modern postural yoga[1][a] and transnational anglophone yoga.\nPostures were not central in any of the older traditions of yoga; posture practice was revived in the 1920s by yoga gurus including Yogendra and Kuvalayananda, who emphasised its health benefits. The flowing sequences of Salute to the Sun (Surya Namaskar) were pioneered by the Rajah of Aundh, Bhawanrao Shrinivasrao Pant Pratinidhi, in the 1920s.[4] It and many standing poses used in gymnastics were incorporated into yoga by the yoga teacher Krishnamacharya in Mysore from the 1930s to the 1950s. Several of his students went on to found influential schools of yoga: Pattabhi Jois created Ashtanga Vinyasa Yoga, which in turn led to Power Yoga; B. K. S. Iyengar created Iyengar Yoga, and defined a modern set of yoga postures in his 1966 book Light on Yoga; and Indra Devi taught yoga as exercise to many celebrities in Hollywood. Other major schools founded in the 20th century include Bikram Yoga and Sivananda Yoga. Yoga as exercise spread across America and Europe, and then the rest of the world.\nHaṭha yoga\'s non-postural practices such as its purifications are much reduced or absent in yoga as exercise. The term "hatha yoga" is also in use with a different meaning, a gentle unbranded yoga practice, independent of the major schools, often mainly for women. Practices vary from wholly secular, for exercise and relaxation, through to undoubtedly spiritual, whether in traditions like Sivananda Yoga or in personal rituals. Yoga as exercise\'s relationship to Hinduism is complex and contested; some Christians have rejected it on the grounds that it is covertly Hindu, while the "Take Back Yoga" campaign insisted that it was necessarily connected to Hinduism. Scholars have identified multiple trends in the changing nature of yoga since the end of the 19th century. Yoga as exercise has developed into a worldwide multi-billion dollar business, involving classes, certification of teachers, clothing such as yoga pants, books, videos, equipment including yoga mats, and holidays.',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(minutes: 1))),
  NewsFeed(
      id: '2',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyVideoLinks.elementAt(2),
      isVideo: true,
      headLine:
          'Photography contest at IIIT Kottayam, Here is how to participate.',
      description:
          'Photography is the art, application and practice of creating durable images by recording light, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film. It is employed in many fields of science, manufacturing (e.g., photolithography), and business, as well as its more direct uses for art, film and video production, recreational purposes, hobby, and mass communication.\nTypically, a lens is used to focus the light reflected or emitted from objects into a real image on the light-sensitive surface inside a camera during a timed exposure. With an electronic image sensor, this produces an electrical charge at each pixel, which is electronically processed and stored in a digital image file for subsequent display or processing. The result with photographic emulsion is an invisible latent image, which is later chemically "developed" into a visible image, either negative or positive depending on the purpose of the photographic material and the method of processing. A negative image on film is traditionally used to photographically create a positive image on a paper base, known as a print, either by using an enlarger or by contact printing.',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(minutes: 1))),
  NewsFeed(
      id: '3',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(10),
      headLine:
          'Paytm credit card coming soon, around 2 million cards to be issued in 18 months',
      description:
          'HIGHLIGHTS\nPaytm that it is coming up with credit cards to make it easier for new users to join the credit market.\nPaytm is designing a special feature that would allow users to manage their transactions and have full control over the card usage\nTo enable the process, Paytm will partner with leading banks in the country.\nPaytm on Monday has announced that it is coming up with credit cards to make it easier for new users to join the credit market. The company said that its new credit card has been designed to “democratise the access to a formal credit system for the masses”. Paytm is designing a special feature that would allow users to manage their transactions and have full control over the card usage. To enable the process, Paytm will partner with leading banks. It also aims to issue two million cards in the next 12-18 months.\nTalking about launching credit cards, Bhavesh Gupta, CEO - Paytm Lending said, “In our country, credit cards are still considered a product for the affluent sections of the society and not everyone can avail of its benefits. At Paytm, our aim is to provide credit cards that benefit India’s aspiring youth and evolved professionals. These cards are designed to help them lead a healthier financial life through managing and analyzing the spends to make well-informed decisions. This can transform the credit market by bringing \'new to credit\' users into the formal economy.”With its credit card, Paytm aims to bring the credit card experience to the young professionals and the college-goers. The company in a statement said that aims to provide complete control to cardholders to manage their transactions in real-time. Users can instantly change the security pin number, update the address, block the card in case of loss or fraud prevention, apply for a duplicate card, and view outstanding credit-limit. It will also provide insurance protection against fraudulent transactions to protect users\' money.\nPaytm has said that everything can be controlled from the app and users will not have to visit the bank branch or call customer support. “Paytm Credit cards will have a transparent & compelling rewards program with assured cashback on every transaction. The accrued rewards point will have no expiry and users will also be able to utilize those for various payments in the Paytm ecosystem. Since the cashback will be received directly in the form of Paytm Gift Vouchers, they can be spent anywhere. It will also give great lifestyle benefits for the users in the form of discount vouchers & complimentary memberships across travel, entertainment, food, and many such categories,” Paytm said in a statement.',
      type: NewsType.Technical,
      timePosted: DateTime.now().subtract(Duration(minutes: 30))),
  NewsFeed(
      id: '4',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(11),
      headLine:
          'PUBG ban in India: Why gamers can still download, play the game',
      description:
          'It has been more than a month since the government banned PUBG or PlayerUnknown\' Battlegrounds and PUBG Mobile Lite in the country. Despite the ban, reports have emerged that some users still have access to the game.\nAccording to a report by the InsideSport, the PUBG players are playing the game by side-loading the game APK on their phones and then connecting it to the internet. This method gives a user access to the game servers and allows them to play the game.\nThe report added that this strategy works only on Samsung and Xiaomi phones. Samsung and Xiaomi automatically download APK files through a mobile browser. The device then takes permission to install.\nBesides, the PUBG game is working because internet service providers have to completely filter out IP addresses of the game servers.\nThe PUBG game is also available on consoles and PCs. PUBG enthusiasts can still play the game on their PC, XBox, or PS4. Hence, many PUBG players are now eyeing the laptop and desktop variant of the game.\nIn fact, PUBG and PUBG Mobile are two different games made by two different developers. The PC version\'s developers are not Chinese. PUBG was originally created by Brendan Greene, an Irish video game designer. The game\'s PC and consoles versions were acquired by South Korean gaming studio Bluehole. And, Tencent was given the right to create a mobile adaptation of the game. Notably, Tencent\'s association is limited to the mobile version of the game and not the one that is available to play on PC and gaming consoles.\nWhile PUBG Mobile is a free to play game but to play on PC, one has to buy PUBG via Steam. PUBG costs Rs 999 to play via Steam, a digital distribution service for online games, on PC. For this, PUBG players must need Intel Core i5-4430 or AMD FX-6300 processor with 8 GB RAM, NVIDIA GForce GTX 960 2GB or AMD Radeon R7 370 2GB graphics, 64-bit Windows 7, DirectX version 11 and a minimum of 30 GB storage to play the game on PC via Steam.\nOne can also opt for PUBG Lite for PC to play a free version on Windows on low-end laptops. However, PUBG Lite has low-end graphics.\n',
      type: NewsType.General,
      timePosted: DateTime.now().subtract(Duration(hours: 3))),
  NewsFeed(
      id: '5',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(12),
      headLine:
          'Amazon vs Flipkart sales: Up to Rs 28,000 discount on top smartphones',
      description:
          'The Amazon and Flipkart festive sales are all set to start this week. Amazon Great Indian Festival 2020 sale will kick off at midnight on October 16 for Prime subscribers, and from October 17 for everyone else. Flipkart\'s Big Billion Days 2020 sale will begin at 12 noon on October 15 for Plus members, and October 16 for everyone else.\nBoth the e-commerce firms have promised huge discounts. The sale will be available on a range of products, including home appliances, clothes, gadgets, toys, and groceries.\nAmazon Great Indian Festival 2020: Best deals on mobile phones\nAmazon\'s Apple iPhone 11 deal is one of the most sought-after sales offers right now. The latest banner on Amazon India website says the iPhone 11 will be priced at Rs 4_,999. "The most powerful iPhone ever at the lowest ever price," it reads. So, even if the smartphone is priced at Rs 49,999, it\'ll be over Rs 18,000 less than the current price. The iPhone 11 is currently priced at Rs 68,300 on Amazon India and Apple online store.\nNot just Apple\'s iPhones, Amazon is offering discounts on OnePlus 8 phones. The One Plus 6+ 128 GB variant will be sold for Rs 39,999, instead of Rs 41,999.\nThe OnePlus8+128GB will be available for Rs 41,999 down from Rs 44,999, and the 12 + 256 GB variant of OnePlus 8 will be available for Rs 44,999, down from Rs 49,999.\nOnePlus 7T Pro price has also been reduced during the Amazon Great Indian Festival Sale season. The phone will be available for Rs 43,999, instead of Rs 53,999.\nDuring the sale, Samsung Galaxy M51 will be available at a starting price of Rs 22,499, down from Rs 24,999.\nOn Redmi Noe 9 Pro, Amazon is giving a discount of Rs 4,000. The phone will be sold for Rs 12,999, down from Rs 16,999 during the sale.\nThe Mi 10 5G  smartphone will be available for Rs 44,999, instead of Rs 54,999 in Amazon. Amazon is also offering a slew of offers on Oppo, Vivo, and other smartphones.\nFlipkart Big Billion Days: Best deals on mobile phones\nWalmart-owned Flipkart has also promised to offer discounts on smartphones to its customers. The etailer will be offering Rs 33,001 discount on Samsung Galaxy S20+. The phone\'s original price is Rs 83,000 and during the Big Billion Days, it will be sold for Rs 49,999. Moreover, under Flipkart\'s "smart upgrade plan", the phone price will come down to Rs 35,198.\nSimilarly, Samsung Galaxy Note 10 Plus will be available for Rs 54,999, instead of Rs 85,000. And, under Flipkart\'s smart upgrade, the Galaxy Note 10+ will be sold for Rs 38,998.\nDiscounts are also available on Realme phones. Realme X50 Pro will be available for Rs 36,999 from Rs 41,999 on Flipkart. Realme X3 (Up to 8 GB) will be available for Rs 21,999, instead of Rs 26,999. Xiaomi\'s Mi 10 is priced at Rs 49,999. The phone\'s original price is Rs 59,999. Oppo A52 will be sold for Rs 12,990, down from the original price of Rs 17,990.',
      type: NewsType.Technical,
      timePosted: DateTime.now().subtract(Duration(hours: 3, days: 1))),
  NewsFeed(
      id: '6',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(13),
      headLine:
          'Indian startups up the ante against Google; knock on CCI\'s door',
      description:
          'As many as 15 startup founders approached the Competition Commission of India (CCI) on Saturday to bring to the regulator\'s notice Google\'s anti-competitive policies in India.\nThe founders held a virtual meeting with the CCI to complain against the tech giant following recent imposition of Google\'s Play Store billing system on Indian developers.\nAmong those who reportedly attended the meeting comprised founders of nCore Games, Map My India, and Bharat Matrimony.\nAlso Read: Paytm-led Indian startups to unionise against Google; Vijay Shekhar Sharma throws down the gauntlet\nThe startup founders also complained to the anti-trust watchdog about the 30 per cent commission the company (Google) charges for selling digital goods and services through its platform, sources told the Mint.\nThe founders told the CCI that Google has an unfair advantage over its rivals as phones with its Android Operating System (OS) are preloaded with the Play Store app distribution platform.\nBecause of this dominance, Google forces Indian developers "to build and change apps based on its OS and app store," the sources alleged, adding that the company\'s "arbitrary policies" demonstrate this behaviour.\nAlso Read: 42% of startups, SMEs out of cash, closed down; Atma Nirbhar scheme offers little help\n"With more than 95% of India\'s digital population accessing the Internet through Google, this strategy of having an OS and Play Store, together gives Google an advantage over other app stores and operating systems. Hence, we have requested them to look into this matter," one of the founders present at the meeting with CCI told the publication.\nThe startup founders are now planning to send a written communication to both the Ministry of Electronics and Information Technology (MeitY) and CCI this week after compiling views from the industry.\nIf the startups file a lawsuit against Google with the CCI, it will be the fifth such case Google is going to face in India.',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(days: 3))),
  NewsFeed(
      id: '7',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.elementAt(14),
      headLine:
          'Sony PlayStation 5 India prices announced, start from Rs 39,990',
      description:
          'HIGHLIGHTS\nSony PlayStation 5 will cost Rs 49,990 in India.\nThe price of the PlayStation 5 Digital Edition in India is going to be Rs 39,990.\nThe PlayStation 5 launch date for India is rumoured to be November 19.\nSony has revealed the prices for the PlayStation 5 in the country. Prices of both PlayStation5 and the PlayStation 5 Digital Edition have been revealed. The PlayStation 5 will cost Rs 49,990 in India while the price of the PlayStation 5 Digital Edition is set for Rs 39,990.\nThe pricing for the PlayStation 5 is similar to the price of the Xbox X, which Microsoft revealed earlier. Just like the PlayStation 5, the Microsoft Xbox X will also cost Rs 49,990. But the Digital Edition price of the PlayStation 5 is different from the price of comparable Microsoft Xbox Series S. While the Xbox Series S will cost Rs 34,990 in India PlayStation 5 Digital Edition will cost Rs 39,990.\nThere are no official details available on when the PlayStation 5 will go on sale in India. There is apparently a tangle related to copyright over the name PS5 that Sony has to resolve first but rumours of the PlayStation 5 Indian launch date have started coming. A report on October 16 said that the PlayStation 5 will launch in India on November 19.\nMicrosoft had earlier confirmed that the Xbox Series X and Series S will be launched in India on November 10, and the pre-orders for both consoles have already started in India.\nApart from the details of the PlayStation 5, Sony has also revealed that the DualSense wireless controller for these consoles will cost Rs 5,990 in India.\nThe next-generation from both Sony and Microsoft this time make use of graphics and general purpose hardware from AMD. Both consoles have 8-core processors but the raw graphics performance is slightly more in the Xbox. Then again, the feature set, exclusive titles, and other details differ between the two gaming consoles so it is not going to be a direct comparison between the value of the PS5 and the Xbox X.',
      type: NewsType.General,
      timePosted: DateTime.now().subtract(Duration(days: 7, hours: 1))),
  NewsFeed(
      id: '8',
      uid: '1',
      userImageLink: null,
      userName: 'IIIT Kottayam',
      downloadLink: dummyImageLinks.last,
      headLine:
          'Apple announces free virtual workshops for Indian users on photography and music',
      description:
          'HIGHLIGHTS\nApple is holding free virtual sessions for people interested in music, photography and art.\nMany of these sessions are aimed at beginners learning photography using an iPhone.\nApple is also hosting sessions for beginners learning the garage band app.\nApple has announced a series of free virtual sessions from October 17 to November 29 in the light of the launch of the Apple Store online in India. The event will be ideal for budding photographers, musicians and artists as leading local photographers and acclaimed musicians will speak about their stories and the inspiration behind their projects. These experts will share tips and tricks with users who register for the Apple events.\nThe free virtual sessions will start from October 22 mainly focussed on photography with photographers like Siddhartha Joshi and Avani Rai on October 22 and October 27 respectively from 7 to 8 PM. The photography sessions are called Photo Lab.\nJoshi will show portrait projects that he has taken across the subcontinent, capturing India’s uniquely diverse population professional photo tips, and teach how he uses iPhone, DSLR and mirrorless cameras. Rai will share some of her favourite images and reveal how she selects the right instant to shoot a scene. Rai’s images have been featured in outlets such as Vogue and GQ, and her documentary focusing on her photographer father has toured festivals worldwide.\nOn October 29, Anurag Banerjee will host an event on non-fiction photography speaking about how great non-fiction photography combines universal narratives with individual experience. On November 3, Prarthna Singh will take a session on Portrait photography. She has been commissioned by The New York Times and the FT, and clients including Nike and Uniqlo.\nApple has three sessions teaching photography on iPhones on October 28, November 1 and November 2.\n“You’ll explore the latest camera features to compose a great shot, experiment with focus and exposure, and use advanced lighting settings to capture some dramatic moments. Have your iPhone ready for this virtual session,” Apple notes.\nOn November 5, Hashim Badani will give a session on photographic narrative and will share how he plans his projects, balancing deep research with creative improvisation and shaping them into storylines.\nOn November 4,8 and 10, Apple is hosting sessions for beginners learning the garage band app. The sessions, recommended for beginners will show to start a song in GarageBand using Live Loops in a 60-minute session. To take part, users will need an iPhone or iPad with the GarageBand app downloaded which is available free from the App Store.\nTo join, you will need a computer, laptop, mobile or tablet device; a stable internet connection; and the free Cisco Webex Meetings app. If you’re under 18, your parent or legal guardian can register for you.',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(days: 30))),
];
