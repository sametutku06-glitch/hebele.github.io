# GitHub'dan tek push ile yayınlama

Bu depo GitHub Pages için değil, Cloudflare Worker için hazırlanmıştır. Böylece öğrenci ve yönetici şifreleri tarayıcıya açılmaz.

## Bir defalık Cloudflare hazırlığı

Cloudflare panelinde aynı hesapta şunları oluşturun:

- D1 veritabanı: `sinav-cam-portali`
- R2 bucket: `sinav-cam-portali-files`

## GitHub repository secrets

GitHub deposunda **Settings → Secrets and variables → Actions** bölümüne aşağıdaki secret değerlerini girin:

| Secret | Değer |
|---|---|
| `CLOUDFLARE_API_TOKEN` | Workers, D1 ve R2 yayın yetkili Cloudflare API token |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare hesap kimliği |
| `CLOUDFLARE_D1_DATABASE_ID` | Oluşturduğunuz D1 veritabanının kimliği |
| `STUDENT_PASSWORD` | İlk kullanım için `515` |
| `ADMIN_PASSWORD` | İlk kullanım için `utku1` |
| `SESSION_SECRET` | Uzun, rastgele bir metin |

Ardından bu dosyaları GitHub'a gönderip `main` dalına push yapın. **Actions** sekmesi şemayı kurar ve Worker'ı yayınlar. İşlem bittiğinde loglarda canlı adres görünür.

> API token'a en az Workers Scripts:Edit, D1:Edit ve R2:Edit yetkilerini ilgili hesapta verin.
