part of dart_zaim_client;

class ZaimGenre {
  int id;
  String name;
  int sort;
  int active;
  int categoryId;
  int parentGenreId;
  String modified;

  ZaimGenre(Map<String, dynamic> genre) {
    this.id = genre['id'];
    this.name = genre['name'];
    this.active = genre['active'];
    this.sort = genre['sort'];
    this.categoryId = genre['categoryId'];
    this.parentGenreId = genre['parent_genre_id'];
    this.modified = genre['modified'];
  }
}
