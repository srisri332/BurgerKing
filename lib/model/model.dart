class Model{
  // "category": "1",
  //   "title": "Crispy Chicken Supreme × 2",
  //   "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
  //   "cost": 170,
  //   "count": 0,
  //   "veg": true,
  //   "image": "assets/crispychickensupreme.JPG"
  String category,title,subtitle,image;
  final cost;
  bool veg;
  int count;
  Model({this.cost, this.category, this.count, this.image,this.subtitle,this.title,this.veg});
}