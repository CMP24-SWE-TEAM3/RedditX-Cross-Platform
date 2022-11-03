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
    karma: 25,
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
