# Marvel Comics Heroes App

Endpoint bağlantısını sağlayabilmek için hashKey oluşturulması gerekmektedir. HashKey oluşturabilmek için; [developer.marvel.com](http://developer.marvel.com) adresinden privateKey ve publicKey oluşturup, daha sonra bu keyleri; [https://md5.cz](https://md5.cz) adresinden **timestampPrivatekeyPublickey** yan yana gelecek şekilde yapıştırıp, oluşan md5 hashKey i uygulamanızda kullanabilirsiniz. 

Ya da hasKey oluşturmak için convertToMd5 eklentisini kullanabilirsiniz.
