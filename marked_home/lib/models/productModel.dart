class ProductModel {
  String? image;
  bool isLike = false;
  List<String>? commentList;

  ProductModel(this.image,  {this.isLike = false, this.commentList});
}