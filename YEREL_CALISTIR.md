# Yerelde açma

`public/index.html` dosyasına çift tıklamak çalışmaz. Bu proje şifreleri güvenli biçimde doğrulayan bir Cloudflare Worker kullanır; Worker olmadan tarayıcı API’ye ulaşamaz ve **Failed to fetch** gösterir.

Windows'ta en kolay yol:

1. `START_LOCAL.cmd` dosyasına çift tıklayın.
2. İlk açılışta paketler kurulur ve yerel veritabanı hazırlanır.
3. Komut penceresinde görünen `http://localhost:8787` adresini açın.
4. Öğrenci için `515`, Yönetim için sağ üstteki **Yönetim** düğmesine tıklayıp `utku1` kullanın.

Node.js 20 veya üstü gerekli: https://nodejs.org/

Şifreleri değiştirmek için `.dev.vars` dosyasını düzenleyin. Bu dosya sadece yerel test içindir ve yayımlanmamalıdır.
