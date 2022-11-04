// ignore_for_file: public_member_api_docs, sort_constructors_first
//data of the in search results
class PersonInSearch {
  String userName;
  int karma;
  String about;
  bool followed;
  String img;
  DateTime date;

  PersonInSearch({
    required this.userName,
    required this.karma,
    required this.about,
    required this.followed,
    required this.img,
    required this.date,
  });
}

//dummy data to test
//will be replaced with real data from the APIs
List<PersonInSearch> peoplesList = [
  PersonInSearch(
    userName: 'Donia',
    karma: 2500,
    about: '',
    followed: true,
    img:
        'https://hips.hearstapps.com/hbu.h-cdn.co/assets/16/11/gettyimages-157418577.jpg',
    date: DateTime(2021, 10, 2),
  ),
  PersonInSearch(
    userName: 'Sara',
    karma: 2521,
    about:
        'BBBBBBBAABBBBBBBBBBBBBBBBBBBBBBBAABBBBBBBBBBBBBBBBBBBBBBBAABBBBBBBBBBBBBBBBBBBBBBBAABBBBBBBBBBBBBBBBAAAAAAAAA',
    followed: false,
    img:
        'https://hips.hearstapps.com/hbu.h-cdn.co/assets/16/11/gettyimages-157418577.jpg',
    date: DateTime(2022, 3, 2),
  ),
  PersonInSearch(
    userName: 'Heba',
    karma: 25123456,
    about: 'AABBBBBBBBBBBBBBBB',
    followed: false,
    img:
        'https://hips.hearstapps.com/hbu.h-cdn.co/assets/16/11/gettyimages-157418577.jpg',
    date: DateTime(2022, 10, 20),
  ),
  PersonInSearch(
    userName: 'Heba',
    karma: 25123456,
    about: 'AABBBBBBBBBBBBBBBB',
    followed: false,
    img:
        'https://hips.hearstapps.com/hbu.h-cdn.co/assets/16/11/gettyimages-157418577.jpg',
    date: DateTime(2021, 12, 20),
  ),
];

/////////////////////////
//data of the in search results
class CommunityInSearch {
  String name;
  int membersCount;
  String img;
  String about;
  bool joined;

  CommunityInSearch({
    required this.name,
    required this.membersCount,
    required this.img,
    required this.about,
    required this.joined,
  });
}

//dummy data to test
//will be replaced with real data from the APIs
List<CommunityInSearch> communitiesList = [
  CommunityInSearch(
    name: 'DDDOOONNN',
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    about:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&shttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&shttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    membersCount: 1220,
    joined: false,
  ),
  CommunityInSearch(
    name: 'HHHEEHHEE',
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    about:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&shttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&shttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    membersCount: 111222333,
    joined: true,
  ),
  CommunityInSearch(
    name: 'HHEEBBNNNN',
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    about: '',
    membersCount: 113,
    joined: false,
  ),
];

class PostInSearch {
  String postText;
  String communityName;
  String userName;
  String communityIcon;
  String flairText;
  DateTime createdAt;
  int votesCount;
  int commentsCount;
  List<String> attachedMedia;
  bool nsfw;
  bool spoiler;
  PostInSearch({
    required this.postText,
    required this.communityName,
    required this.userName,
    required this.communityIcon,
    required this.flairText,
    required this.createdAt,
    required this.votesCount,
    required this.commentsCount,
    required this.attachedMedia,
    required this.nsfw,
    required this.spoiler,
  });
}

List<PostInSearch> postsList = [
  PostInSearch(
    postText:
        'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
    communityName: 'u/communityName',
    userName: 'u/userName',
    communityIcon:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    flairText: 'News',
    createdAt: DateTime(2021, 10, 30),
    votesCount: 125,
    commentsCount: 0,
    attachedMedia: [],
    nsfw: true,
    spoiler: true,
  ),
  PostInSearch(
    postText:
        'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
    communityName: 'u/communityName',
    userName: 'u/userName',
    communityIcon:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    flairText: 'Politics',
    createdAt: DateTime(2021, 11, 7),
    votesCount: -1555,
    commentsCount: 0,
    attachedMedia: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    ],
    nsfw: true,
    spoiler: true,
  ),
  PostInSearch(
    postText:
        'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
    communityName: 'u/communityName',
    userName: 'u/userName',
    communityIcon:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    flairText: '',
    createdAt: DateTime(2021, 12, 5),
    votesCount: 1002,
    commentsCount: 0,
    attachedMedia: [],
    nsfw: true,
    spoiler: true,
  ),
  PostInSearch(
    postText:
        'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
    communityName: 'u/communityName',
    userName: 'u/userName',
    communityIcon:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
    flairText: '',
    createdAt: DateTime(2022, 11, 2),
    votesCount: 2102233,
    commentsCount: 0,
    attachedMedia: [],
    nsfw: true,
    spoiler: true,
  ),
];
