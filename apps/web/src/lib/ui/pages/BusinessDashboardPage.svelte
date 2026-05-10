<script lang="ts">
  const appointments = [
    {
      time: "19:00 - 20:00",
      customer: "Ahmet Yilmaz Grubu",
      status: "Odendi",
      statusClass: "bg-uh-success text-emerald-900"
    },
    {
      time: "20:00 - 21:00",
      customer: "Mehmet Demir Grubu",
      status: "Elden Alinacak",
      statusClass: "bg-uh-warning text-amber-950"
    }
  ];
</script>

<section class="mx-auto max-w-[1400px] px-4 py-8 md:px-8">
  <div class="overflow-hidden rounded-card border border-uh-border bg-white lg:grid lg:grid-cols-[260px_1fr]">
    <aside class="bg-uh-sidebar text-slate-100">
      <div class="border-b border-white/10 p-6">
        <p class="text-3xl font-bold text-emerald-300">Ucan Hali</p>
        <p class="mt-1 text-sm text-slate-300">Isletme</p>
      </div>

      <nav class="p-3 text-sm">
        <button type="button" class="mb-1 flex w-full items-center rounded-btn bg-emerald-900/40 px-4 py-3 text-left font-semibold">
          Gosterge Paneli
        </button>
        <button type="button" class="mb-1 flex w-full items-center rounded-btn px-4 py-3 text-left text-slate-300 hover:bg-white/5">
          Takvim Yonetimi
        </button>
        <button type="button" class="mb-1 flex w-full items-center rounded-btn px-4 py-3 text-left text-slate-300 hover:bg-white/5">
          Finans & Raporlar
        </button>
      </nav>

      <div class="mt-28 border-t border-white/10 p-3">
        <button type="button" class="flex w-full items-center rounded-btn px-4 py-3 text-left text-slate-300 hover:bg-white/5">
          Cikis Yap
        </button>
      </div>
    </aside>

    <div class="bg-uh-bg p-6 md:p-8">
      <div class="mb-6 flex justify-end">
        <button type="button" class="rounded-btn bg-uh-primary px-5 py-3 text-sm font-semibold text-white">
          + Yeni Manuel Rezervasyon Ekle
        </button>
      </div>

      <div class="grid gap-4 md:grid-cols-3">
        <article class="rounded-card border border-uh-border bg-white p-5">
          <p class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Bugunku Doluluk</p>
          <p class="mt-2 text-5xl font-bold text-uh-text">%85</p>
          <p class="mt-1 text-sm text-uh-muted">(2 Bos Saat)</p>
        </article>
        <article class="rounded-card border border-uh-border bg-white p-5">
          <p class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Beklenen Kasa</p>
          <p class="mt-2 text-5xl font-bold text-uh-text">14.500 TL</p>
        </article>
        <article class="rounded-card border border-uh-border bg-white p-5">
          <p class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Online Odemeler</p>
          <p class="mt-2 text-5xl font-bold text-uh-text">4.000 TL</p>
          <p class="mt-1 text-sm text-uh-muted">(Uygulamadan gelen)</p>
        </article>
      </div>

      <div class="mt-8">
        <h2 class="text-3xl font-bold text-uh-text">Bugunun Randevulari (18:00 - 00:00)</h2>
        <div class="mt-4 overflow-hidden rounded-card border border-uh-border bg-white">
          <table class="w-full border-collapse">
            <thead class="bg-uh-sidebar text-left text-xs font-semibold tracking-[0.12em] text-white uppercase">
              <tr>
                <th class="px-4 py-3">Saat Araligi</th>
                <th class="px-4 py-3">Grup / Musteri</th>
                <th class="px-4 py-3">Durum</th>
                <th class="px-4 py-3 text-right">Islemler</th>
              </tr>
            </thead>
            <tbody>
              {#each appointments as appointment}
                <tr class="border-t border-uh-border">
                  <td class="px-4 py-4 text-sm font-medium text-uh-text">{appointment.time}</td>
                  <td class="px-4 py-4 text-sm text-uh-text">{appointment.customer}</td>
                  <td class="px-4 py-4">
                    <span class={`rounded-btn px-3 py-1 text-xs font-semibold uppercase ${appointment.statusClass}`}>
                      {appointment.status}
                    </span>
                  </td>
                  <td class="px-4 py-4 text-right">
                    <div class="inline-flex gap-2">
                      <button type="button" class="rounded-btn border border-uh-border bg-white px-3 py-2 text-xs font-semibold">
                        Duzenle
                      </button>
                      <button type="button" class="rounded-btn border border-uh-border bg-white px-3 py-2 text-xs font-semibold">
                        Saati Kapat
                      </button>
                    </div>
                  </td>
                </tr>
              {/each}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>
