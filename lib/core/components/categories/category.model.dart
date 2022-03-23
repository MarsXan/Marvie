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
