part of dart_zaim_client;

abstract class MoneyRequestParameter {
  int _mapping = 1;
  int categoryId;
  int genreId;
  int amount;
  String date;
  int fromAccountId;
  int toAccountId;
  String place;
  String comment;
  String name;

  MoneyRequestParameter(
      {this.categoryId,
      this.genreId,
      this.amount,
      this.date,
      this.fromAccountId,
      this.toAccountId,
      this.place,
      this.comment,
      this.name});

  Map<String, String> toRequestBody() {
    Map<String, String> params = {'mapping': _mapping.toString()};
    if (categoryId != null) {
      params['category_id'] = categoryId.toString();
    }
    if (genreId != null) {
      params['genre_id'] = genreId.toString();
    }
    if (amount != null) {
      params['amount'] = amount.toString();
    }
    if (date != null) {
      params['date'] = date.toString();
    }
    if (fromAccountId != null) {
      params['from_account_id'] = fromAccountId.toString();
    }
    if (toAccountId != null) {
      params['to_account_id'] = toAccountId.toString();
    }
    if (place != null) {
      params['place'] = place.toString();
    }
    if (name != null) {
      params['name'] = name.toString();
    }
    if (comment != null) {
      params['comment'] = comment.toString();
    }
    return params;
  }
}

class PaymentRequestParameter extends MoneyRequestParameter {
  PaymentRequestParameter(amount, date, categoryId, genreId,
      {fromAccountId, toAccountId, place, comment, name})
      : super(
            categoryId: categoryId,
            genreId: genreId,
            amount: amount,
            date: date,
            fromAccountId: fromAccountId,
            toAccountId: toAccountId,
            place: place,
            comment: comment,
            name: name);
}

class IncomeRequestParameter extends MoneyRequestParameter {
  IncomeRequestParameter(amount, date, categoryId,
      {toAccountId, place, comment})
      : super(
            categoryId: categoryId,
            amount: amount,
            date: date,
            toAccountId: toAccountId,
            place: place,
            comment: comment);
}

class TransferRequestParameter extends MoneyRequestParameter {
  TransferRequestParameter(amount, date, fromAccountId, toAccountId, {comment})
      : super(
            amount: amount,
            date: date,
            fromAccountId: fromAccountId,
            toAccountId: toAccountId,
            comment: comment);
}

class UpdateRequestParameter extends MoneyRequestParameter {
  UpdateRequestParameter(amount, date,
      {fromAccountId, toAccountId, genreId, categoryId, comment})
      : super(
            amount: amount,
            date: date,
            fromAccountId: fromAccountId,
            toAccountId: toAccountId,
            genreId: genreId,
            categoryId: categoryId,
            comment: comment);
}
