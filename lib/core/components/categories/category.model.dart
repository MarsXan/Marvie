class CategoryItem {
  int id;
  String title;
  String? emoji;

  CategoryItem({required this.id, required this.title, this.emoji});
}

var categoryList = [
  CategoryItem(id: 0, title: "All"),
  CategoryItem(id: 1, title: "Party", emoji: "🎉"),
  CategoryItem(id: 2, title: "Camping", emoji: "🏕"),
  CategoryItem(id: 3, title: "Beach", emoji: "⛱"),
  CategoryItem(id: 4, title: "Party", emoji: "🎉")
];

var categoryList2 = [
  CategoryItem(id: 0, title: "Hot", emoji: "🔥"),
  CategoryItem(id: 1, title: "Woman", emoji: "👚"),
  CategoryItem(id: 2, title: "Man", emoji: "👕"),
  CategoryItem(id: 3, title: "Undies", emoji: "👙"),
  CategoryItem(id: 4, title: "Camping", emoji: "🏕"),
  CategoryItem(id: 5, title: "Beach", emoji: "⛱"),
  CategoryItem(id: 6, title: "Party", emoji: "🎉")
];
