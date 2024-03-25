import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyNotifier with ChangeNotifier {}

final images = <ImageProvider>[
  const NetworkImage(
      "https://cdn.vox-cdn.com/thumbor/UixJG8lZQVN9qI6pBcxprYOsWeA=/0x0:1920x1080/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/68876614/26355890.6.jpeg"),
  const NetworkImage(
      "https://assets-prd.ignimgs.com/2022/08/17/top25animecharacters-blogroll-1660777571580.jpg"),
  const NetworkImage(
      "https://hips.hearstapps.com/hmg-prod/images/index-anime-1674137684.jpg?crop=0.502xw:1.00xh;0.250xw,0&resize=1200:*"),
  const NetworkImage(
      "https://c.files.bbci.co.uk/F382/production/_123883326_852a3a31-69d7-4849-81c7-8087bf630251.jpg"),
  const NetworkImage(
      "https://www.hindustantimes.com/ht-img/img/2023/02/14/550x309/Understanding_the_different_genres_and_sub-genres_1676377654248_1676377654458_1676377654458.png"),
  const NetworkImage(
      "https://timesofindia.indiatimes.com/photo/104670161/104670161.jpg"),
  const NetworkImage("https://img.youtube.com/vi/KuUhYOyJn78/sddefault.jpg"),
  const NetworkImage(
      "https://hips.hearstapps.com/hmg-prod/images/screen-shot-2024-01-16-at-4-55-07-pm-65a6fb45e7d31.png?crop=0.8558827713757291xw:1xh;center,top&resize=1200:*"),
  const NetworkImage(
      "https://imgix.ranker.com/list_img_v2/18020/2378020/original/2378020-u1?fit=crop&fm=pjpg&q=80&dpr=2&w=1200&h=720"),
  const NetworkImage(
      "https://www.gamespot.com/a/uploads/screen_kubrick/1732/17320263/4019145-anime-dek-image.jpg"),
  const NetworkImage(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Anime_Girl.png/1280px-Anime_Girl.png"),
  const NetworkImage(
      "https://i.insider.com/5e820b04671de06758588fb8?width=700"),
  const NetworkImage(
      "https://cdn.vox-cdn.com/thumbor/xBIBkXiGLcP-kph3pCX61U7RMPY=/0x0:1400x788/1200x800/filters:focal(588x282:812x506)/cdn.vox-cdn.com/uploads/chorus_image/image/70412073/0377c76083423a1414e4001161e0cdffb0b36e1f_760x400.0.png"),
];
