# Secret Management (Ucan Hali)

Bu projede gizli bilgiler repoya yazilmaz.

## 1) Frontend gizli degiskenler

- Gercek degerleri `apps/web/.env.local` dosyasina yaz.
- Bu dosya `.gitignore` nedeniyle push edilmez.
- Repo icinde sadece `apps/web/.env.example` tutulur.

## 2) Backend gizli degiskenler

- Gercek degerleri `services/api/appsettings.Local.json` dosyasina yaz
  **veya** `dotnet user-secrets` kullan.
- `appsettings.Local.json` dosyasi `.gitignore` ile korunur.
- Repo icinde sadece `services/api/appsettings.example.json` tutulur.

## 3) GitHub token / PAT

- Token ve benzeri sirlari proje icinde sadece su klasorde tut:
  - `d:\UCAN_HALI\.secrets\`
- Bu klasor `.gitignore` nedeniyle push edilmez.
- Otomatik push icin token dosyasi:
  - `d:\UCAN_HALI\.secrets\github_pat.txt`
  - `scripts/publish.ps1` bu dosyayi bulursa token ile push dener.

## 4) Agent guvenlik kurali

- `.cursor/rules/ucan-hali-secrets-guard.mdc` dosyasi ile agent'a secret dosyalarina dokunmama kurali verildi.
- Secret dosyalarini yine de paylasmamak en guvenli yontemdir.

## 5) Push oncesi kontrol

- `git status --short`
- `git diff --cached --name-only`
- `.env`, `appsettings.Local.json`, `.secrets/`, `*.secret` gibi dosyalar listede olmamali.

## 6) Tek komutla gonderim

- PowerShell: `.\scripts\publish.ps1 "mesaj"`
- Batch (tek tik): `.\scripts\publish.bat mesaj`
