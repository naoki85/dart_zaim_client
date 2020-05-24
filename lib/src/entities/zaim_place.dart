part of dart_zaim_client;

class ZaimPlace {
  int id;
  int userId;
  int genreId;
  int categoryId;
  int accountId;
  int transferAccountId;
  String mode;
  String placeUid;
  String service;
  String name;
  String originalName;
  String tel;
  int count;
  int placePatternId;
  int calcFlag;
  int editFlag;
  int active;
  String modified;
  String created;

  ZaimPlace(Map<String, dynamic> place) {
    this.id = place['id'];
    this.userId = place['user_id'];
    this.genreId = place['genre_id'];
    this.categoryId = place['category_id'];
    this.accountId = place['account_id'];
    this.transferAccountId = place['transfer_account_id'];
    this.mode = place['mode'];
    this.placeUid = place['place_uid'];
    this.service = place['service'];
    this.name = place['name'];
    this.originalName = place['original_name'];
    this.tel = place['tel'];
    this.count = place['count'];
    this.placePatternId = place['place_pattern_id'];
    this.calcFlag = place['calc_flag'];
    this.editFlag = place['edit_flag'];
    this.active = place['active'];
    this.modified = place['modified'];
    this.created = place['created'];
  }
}
