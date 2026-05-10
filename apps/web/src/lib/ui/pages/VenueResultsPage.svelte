<script lang="ts">
  const venues = [
    {
      name: "Merkez Spor Tesisleri",
      address: "Alacasuluk Mah. 100. Yil Bulvari, Karaman",
      ground: "Suni Cim",
      type: "Kapali Saha",
      slots: ["19:00", "20:00", "21:00", "22:30"]
    },
    {
      name: "Karaman Arena",
      address: "Universite Yolu Uzeri, 5. Km, Karaman",
      ground: "Akrilik Kaplama",
      type: "Kapali Saha",
      slots: ["23:00"]
    }
  ];
</script>

<section class="mx-auto max-w-[1200px] px-4 py-10 md:px-8">
  <div class="grid gap-6 lg:grid-cols-[280px_1fr]">
    <aside class="h-fit rounded-card border border-uh-border bg-uh-surface p-5">
      <h2 class="text-2xl font-bold text-uh-text">Filtreler</h2>
      <div class="mt-6 space-y-3 text-sm text-uh-text">
        <label class="flex items-center gap-3"><input type="checkbox" /> Acik Saha</label>
        <label class="flex items-center gap-3"><input checked type="checkbox" /> Kapali Saha</label>
        <label class="flex items-center gap-3"><input checked type="checkbox" /> Otopark</label>
        <label class="flex items-center gap-3"><input type="checkbox" /> Kredi Karti Gecerli</label>
      </div>
    </aside>

    <div class="space-y-4">
      <div class="flex items-center justify-between">
        <h2 class="text-3xl font-bold text-uh-text md:text-5xl">Karaman Sonuclari</h2>
        <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">2 Tesis Bulundu</span>
      </div>

      {#each venues as venue}
        <article class="grid overflow-hidden rounded-card border border-uh-border bg-uh-surface md:grid-cols-[300px_1fr_220px]">
          <div class="h-[220px] bg-gradient-to-b from-emerald-900 to-emerald-600"></div>

          <div class="space-y-4 p-5">
            <h3 class="text-3xl font-bold text-uh-text">{venue.name}</h3>
            <p class="text-sm text-uh-muted">{venue.address}</p>
            <div class="grid grid-cols-2 gap-6 text-sm">
              <div>
                <p class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Zemin</p>
                <p class="mt-1 font-medium">{venue.ground}</p>
              </div>
              <div>
                <p class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Tip</p>
                <p class="mt-1 font-medium">{venue.type}</p>
              </div>
            </div>
          </div>

          <div class="border-l border-uh-border p-5">
            <p class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Bugun Bos Saatler</p>
            <div class="mt-4 grid grid-cols-2 gap-2">
              {#each venue.slots as slot}
                <button type="button" class="rounded-btn bg-uh-primary px-2 py-2 text-sm font-semibold text-white">
                  {slot}
                </button>
              {/each}
            </div>
          </div>
        </article>
      {/each}
    </div>
  </div>
</section>
