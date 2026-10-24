# Cam Sınav Arşivi

Cloudflare Workers tabanlı, giriş şifreli ve yönetilebilir PDF sınav portalı. Öğrenci erişim anahtarı ve yönetici şifresi istemcide bulunmaz; Worker ortam değişkenlerinde tutulur.

GitHub'a gönderip otomatik yayınlamak için [GITHUB_KURULUM.md](GITHUB_KURULUM.md) dosyasını izleyin.

## Kurulum ve yayınlama

1. `npm install` ve ardından `npx wrangler login` çalıştırın.
2. Cloudflare panelinde bir **D1** veritabanı (`sinav-cam-portali`) ve bir **R2** kovası (`sinav-cam-portali-files`) oluşturun. D1 kimliğini `wrangler.jsonc` içindeki `database_id` alanına koyun.
3. Yerel test için `.dev.vars.example` dosyasını `.dev.vars` adıyla kopyalayın. Üretimde aynı üç değeri Cloudflare secret olarak girin:

   ```bash
   npx wrangler secret put STUDENT_PASSWORD
   npx wrangler secret put ADMIN_PASSWORD
   npx wrangler secret put SESSION_SECRET
   ```

   İlk iki değeri sırasıyla `515` ve `utku1` yapabilirsiniz. `SESSION_SECRET` için uzun, rastgele bir değer kullanın.
4. Şemayı uygulayın: `npm run db:init`.
5. Yayınlayın: `npm run deploy`.

## Davranış ve güvenlik

- Öğrenci doğrulama sunucuda yapılır. Öğrenci anahtarı sadece tarayıcı belleğinde yaşar; sayfa yenilendiğinde veya ziyaret tekrar açıldığında silinir ve yeniden sorulur.
- Yönetici oturumu `HttpOnly`, `Secure`, `SameSite=Strict` çereziyle taşınır.
- PDF ve müzik dosyaları R2’de özel anahtarlarla saklanır; indirme/görüntüleme yetkisi Worker tarafından kontrol edilir.
- Yönetim ekranından PDF ekleme, yayınlama, silme, başlık/alt başlık ve giriş ekranı müziği yönetimi yapılır.

Yerel çalışma: `npm run dev`.
