// ignore_for_file: public_member_api_docs, sort_constructors_first
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
