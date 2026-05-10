<script lang="ts">
  const rows = [
    { time: "17:00", values: ["", "Dolu", "", "", "Secili", "Dolu", ""] },
    { time: "18:00", values: ["Dolu", "Dolu", "", "Dolu", "", "Dolu", "Dolu"] },
    { time: "19:00", values: ["", "", "Dolu", "", "", "", ""] }
  ];

  const days = ["Pzt", "Sal", "Car", "Per", "Cum", "Cmt", "Paz"];
</script>

<section class="mx-auto max-w-[1200px] px-4 py-10 md:px-8">
  <h2 class="text-3xl font-bold text-uh-text md:text-5xl">Merkez Spor Tesisleri</h2>

  <div class="mt-4 flex flex-wrap gap-3 text-sm">
    <span class="rounded-btn border border-uh-border bg-uh-surface px-4 py-2">Zemin: Suni Cim</span>
    <span class="rounded-btn border border-uh-border bg-uh-surface px-4 py-2">Kapasite: 7x7</span>
  </div>

  <div class="mt-6 grid gap-6 lg:grid-cols-[1fr_340px]">
    <div class="overflow-hidden rounded-card border border-uh-border bg-uh-surface">
      <table class="w-full border-collapse text-center text-sm">
        <thead class="bg-uh-table-head text-white">
          <tr>
            <th class="border-r border-white/20 px-3 py-3">Saat</th>
            {#each days as day}
              <th class="border-r border-white/20 px-3 py-3 last:border-r-0">{day}</th>
            {/each}
          </tr>
        </thead>
        <tbody>
          {#each rows as row}
            <tr class="border-t border-uh-border">
              <td class="border-r border-uh-border px-3 py-4 font-semibold">{row.time}</td>
              {#each row.values as value}
                <td class="border-r border-uh-border px-3 py-4 last:border-r-0">
                  {#if value === "Secili"}
                    <span class="rounded-btn bg-uh-primary px-3 py-2 text-xs font-semibold text-white">{value}</span>
                  {:else if value}
                    <span class="font-medium text-uh-muted">{value}</span>
                  {/if}
                </td>
              {/each}
            </tr>
          {/each}
        </tbody>
      </table>
    </div>

    <aside class="h-fit rounded-card border border-uh-border bg-uh-surface p-6">
      <h3 class="text-3xl font-bold text-uh-text">Rezervasyon Ozeti</h3>
      <div class="mt-5 space-y-4 border-t border-uh-border pt-4 text-sm text-uh-text">
        <div class="flex items-center justify-between">
          <span class="text-uh-muted">Tarih</span>
          <span class="font-semibold">Cum, 24 Kas</span>
        </div>
        <div class="flex items-center justify-between">
          <span class="text-uh-muted">Saat</span>
          <span class="font-semibold">17:00 - 18:00</span>
        </div>
      </div>
      <div class="mt-6 flex items-center justify-between border-t border-uh-border pt-4">
        <span class="text-sm font-semibold text-uh-muted">Toplam Tutar</span>
        <span class="text-4xl font-bold text-uh-primary">1200 TL</span>
      </div>
      <button type="button" class="mt-6 w-full rounded-btn bg-uh-primary px-4 py-3 text-sm font-semibold text-white">
        Randevuyu Kesinlestir
      </button>
    </aside>
  </div>
</section>
