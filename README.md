# Marvel Comics Heroes App

https://user-images.githubusercontent.com/8598467/175837870-33823fb6-c381-4455-84dd-3ed5a859f0ad.mp4
https://user-images.githubusercontent.com/8598467/175837618-63af0d68-ba32-4017-9eba-2ea868062c73.mp4

![alt text](https://github.com/alper-mf/marvel_characters_app/blob/main/app_preview/screen_shot.png)

Endpoint bağlantısını sağlayabilmek için hashKey oluşturulması gerekmektedir. HashKey oluşturabilmek için; [developer.marvel.com](http://developer.marvel.com) adresinden privateKey ve publicKey oluşturup, daha sonra bu keyleri; [https://md5.cz](https://md5.cz) adresinden **timestampPrivatekeyPublickey** yan yana gelecek şekilde yapıştırıp, oluşan md5 hashKey i uygulamanızda kullanabilirsiniz. 

Ya da hasKey oluşturmak için convertToMd5 eklentisini kullanabilirsiniz.

PROJE Özellikleri:\
[√] Proje ile ilgili TODO lar yerine getirildi.\
[√] Uygulamada cihazın donanımsal özelliklerinden faydalanıldı. (Hoş geldin ekranında, cihazın gyro özelliğinden faydanılarak Spider-Man hareket ettirildi.)\
[√] Uygulama içi geliştirme ortamı (Flavor) kuruldu.\
[√] App Localization yapıldı. Cihazın diline göre uygulama dili otomatik seçiliyor.\
[√] Tema kuruldu.

TODO:\
[√] Ana sayfada karakterler listelenmeli. (Karakter adı ve fotoğrafı).\
[√] İlk açılışta 30 ve scroll sayfa sonuna ulaştığında sonraki sayfa içeriği gelmeli.\
[√] Her sonraki sayfada 30 adet olacak şekilde ilerlemeli.\
[√] Karakterin üzerine tıklandığında detay sayfasına gitmeli.\
[√] Detay sayfasında, karakterin adı, fotoğrafı, açıklaması ve yer aldığı çizgi romanlar listelenmeli.\
[√] Detay sayfasında listenen karakterin yer aldığı çizgi romanlar 2005 yılından sonra yayınlanmış olmalı.\
[√] Son 10 çizgi roman ile limitlenmeli.\
[√] Çizgi romanlar yeniden eskiye doğru sıralanmalı.\
[X] Unit Test\
[X] Snapshot Test

