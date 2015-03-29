#Sinatra MVC

##Yükleme

Depoyu Bilgisayarınıza İndirdikten sonra

`gem install bundler`

Komutunu Kullanarak Yükleyebilirsiniz.

`rackup -p 4567`

Komutunu Kullanarak Sunucuyu Çalıştırabilir ve

http://localhost:4567/

Adresini Kullanarak Uygulamayı Çalıştırabilirsiniz

##Controller

app/Controller Dizini İçerisine Controller Dosyalarınızı Oluşturabilirsiniz

Oluşturmuş Olduğunuz Controller `ApplicationController` Sınıfından Türemiş Olmalıdır.

Örnek İçin:

```
class HomeController < ApplicationController
  get '/' do
    erb :'home/index', :layout => :'home/layout/index'
  end
end
```

##Model

ActiveRecord paketini kullandığı için Rake komutlarını kullanarak kolayca tablolarınızı oluşturabilirsiniz

app/Model içerisine model sınıfınızı oluşturmalısınız oluşturmuş olduğunuz sınıf `ActiveRecord::Base` Modülünden türemiş olmalıdır

Örnek için:

```
class Post < ActiveRecord::Base
end
```

#View

app/Views dizini altına görünümünüzü oluşturmalısınız Controller dosyasında ilişkilendirmek için

`erb :'home/index', :layout => :'home/layout/index'`

Şeklinde kullanabilirsiniz Yukarıdaki örnek view dosyaları:

app/Views/Home/layout/index.erb

```
<html>
<head>
  <%= css_to :"home/css/custom.style.css" %>
  <title>Sinatra MVC</title>
</head>
<body>
<%= yield %>
</body>
</html>
```

app/Views/Home/index.erb

```
<img src="/upload/logo.png" />
<h1>Sinatra MVC</h1>
<h3>Hoş Geldiniz</h3>
```


##Helpers

fonksiyonlar üretmek için helpers dizini içerisine dosyanızı oluşturabilirsiniz

Örnek İçin:
```
module MainHelpers
  def selamla(name)
    "Hoşgeldin, #{name}!"
  end
end
```

Oluşturmuş olduğunuz helpers'ı tüm dosyalarınızda kullanabilmeniz için ApplicationController içerisinde

`helpers MainHelpers` şeklinde çağırmanız gerekmektedir yada hangi controller içinde kullanmak istiyorsanız o controller

içerisinde aynı şekilde çağırabilirsiniz.

##Public

Public dizininde static doyalarınız barınmaktadır

upload dizini altında sitenize yükleyeceğiniz yada upload olarak aldığınız resimler, dosyalar barınmalıdır.

assets dizini altında css, img ve js gibi statik dosyalarınız bulunmalı bu dosyaları view dosyanızda kullanmanız için

Örnek olarak:

`<style href="home/css/custom.style.css" type="text/css" />`

`<img src="/upload/logo.png" />`

şeklinde kullanabilirsiniz.


##DB

Veritabanı yapılandırmasını config dizini altında database.yml dosyasını güncelleyerek gerçekleştirebilirsiniz.