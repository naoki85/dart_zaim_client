# dart_zaim_client

A Project that was made to use the [Zaim API](https://dev.zaim.net) from flutter and dart.  
this package is depended on oauth1.

## Getting Started

First, create your Zaim developer account and your application in [https://dev.zaim.net](https://dev.zaim.net).  
After that, you can get consumer key and consumer secret.  
  
Create a ZaimConfig object in your code.  

```dart
import 'package:dart_zaim_client/dart_zaim_client.dart';

const String ZAIM_CONSUMER_KEY = 'YOUR_CONSUMER_KEY';
const String ZAIM_CONSUMER_SECRET = 'YOUR_CONSUMER_SECRET';

final zaimConfig = ZaimConfig(ZAIM_CONSUMER_KEY, ZAIM_CONSUMER_SECRET);
```

### ZaimAuthorization

For authorization, you can use ZaimAuthorization class.    
This class needs a ZaimConfig argument at initialize.  

```dart
ZaimAuthorization auth = ZaimAuthorization(zaimConfig);
```
This class has two methods.

```
// Get a authorization url with an onetime token.
getRequestTokenUrl(String callbackUri) => Future<String>
```

```
// Get an oauth token and an oauth secret
requestToken(String verifier) => Future<oauth1.Credentials>
```
For more usage, see an example.

### ZaimClient

For call Zaim API with credentials, use this class.  

```dart
final client = ZaimClient(zaimConfig, credentials);
```
This client has below methods.  
Returns the value of the original value as an object.  
For the original return value, refer to [Zaim API doc](https://dev.zaim.net/home/api).

#### User

```
userVerify() => Future<UserVerifyResponse>
```

#### Money

```
getMoneyList() => Future<List<ZaimMoney>> 
```

When request with POST or PUT, arguments are needed two Objects.  

*payment*

| Argument name | Value
----|---- 
| ZaimMoneyType | ZaimMoneyType.PAYMENT
| MoneyRequestParameter | PaymentRequestParameter(100, '2020-05-24', 10101, 101) 

*income*

| Argument name | Value
----|---- 
| ZaimMoneyType | ZaimMoneyType.INCOME
| MoneyRequestParameter | IncomeRequestParameter(100, '2020-05-24', 101)

*transfer*

| Argument name | Value
----|---- 
| ZaimMoneyType | ZaimMoneyType.TRANSFER
| MoneyRequestParameter | TransferRequestParameter(100, '2020-05-24', 101, 102)

```
createMoney(ZaimMoneyType, MoneyRequestParameter) => Future<CreateMoneyResponse> 
```

```
updateMoney(ZaimMoneyType, MoneyRequestParameter) => Future<UpdateMoneyResponse> 
```

```
deleteMoney(ZaimMoneyType, int id) => Future<DeleteMoneyResponse> 
```

#### Category

```
getDefaultCategories() => Future<CategoriesResponse> 
```

```
getCategories() => Future<CategoriesResponse>
```

#### Genre

```
getDefaultGenres() => Future<GenresResponse> 
```

```
getGenres() => Future<GenresResponse> 
```

#### Account

```
getDefaultAccounts() => Future<AccountsResponse> 
```

```
getAccounts() => Future<AccountsResponse> 
```

#### Currency

```
getCurrencies() => Future<CurrenciesResponse> 
```
