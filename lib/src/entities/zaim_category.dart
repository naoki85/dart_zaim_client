part of dart_zaim_client;

class ZaimCategory {
  int id;
  String name;
  String mode;
  int sort;
  int parentCategoryId;
  int active;
  String modified;

  ZaimCategory(Map<String, dynamic> category) {
    this.id = category['id'];
    this.name = category['name'];
    this.mode = category['mode'];
    this.sort = category['sort'];
    this.parentCategoryId = category['parent_category_id'];
    this.active = category['active'];
    this.modified = category['modified'];
  }
}
