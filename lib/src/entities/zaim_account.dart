part of dart_zaim_client;

class ZaimAccount {
  int id;
  String name;
  String mode;
  int sort;
  int parentAccountId;
  int active;
  String modified;

  ZaimAccount(Map<String, dynamic> account) {
    this.id = account['id'];
    this.name = account['name'];
    this.mode = account['mode'];
    this.sort = account['sort'];
    this.parentAccountId = account['parent_account_id'];
    this.active = account['active'];
    this.modified = account['modified'];
  }
}
