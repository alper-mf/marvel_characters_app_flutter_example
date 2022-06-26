# Marvel Comics Heroes App

Endpoint bağlantısını sağlayabilmek için hashKey oluşturulması gerekmektedir. HashKey oluşturabilmek için; [developer.marvel.com](http://developer.marvel.com) adresinden privateKey ve publicKey oluşturup, daha sonra bu keyleri; [https://md5.cz](https://md5.cz) adresinden **timestampPrivatekeyPublickey** yan yana gelecek şekilde yapıştırıp, oluşan md5 hashKey i uygulamanızda kullanabilirsiniz. 

Ya da hasKey oluşturmak için convertToMd5 eklentisini kullanabilirsiniz.

TODO:
[√] Ana sayfada karakterler listelenmeli. (Karakter adı ve fotoğrafı).\
[√] İlk açılışta 30 ve scroll sayfa sonuna ulaştığında sonraki sayfa içeriği gelmeli.\
[√] Her sonraki sayfada 30 adet olacak şekilde ilerlemeli.\
[√] Karakterin üzerine tıklandığında detay sayfasına gitmeli.\
[√] Detay sayfasında, karakterin adı, fotoğrafı, açıklaması ve yer aldığı çizgi romanlar listelenmeli.\
[√] Detay sayfasında listenen karakterin yer aldığı çizgi romanlar 2005 yılından sonra yayınlanmış olmalı.\
[√] Son 10 çizgi roman ile limitlenmeli.\
[√] Çizgi romanlar yeniden eskiye doğru sıralanmalı.\
[X] Unit Test\
[X] Snapshot Test\
 
