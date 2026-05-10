<script lang="ts">
  const ads = [
    { dateTime: "24 Eki 2023 - 20:00", venue: "Merkez Spor Tesisleri, Saha 1", age: "24-28", position: "Kaleci" },
    { dateTime: "24 Eki 2023 - 21:00", venue: "Karaman Arena, Saha 3", age: "20-25", position: "Defans" },
    { dateTime: "25 Eki 2023 - 19:00", venue: "Yildiz Hali Saha, Merkez", age: "30-35", position: "Orta Saha" },
    { dateTime: "26 Eki 2023 - 22:00", venue: "Olimpik Tesisler, Saha 2", age: "25-30", position: "Forvet" },
    { dateTime: "27 Eki 2023 - 20:30", venue: "Merkez Spor Tesisleri, Saha 4", age: "22-26", position: "Defans" }
  ];
</script>

<section class="mx-auto max-w-[1200px] px-4 py-10 md:px-8">
  <div class="flex flex-wrap items-end justify-between gap-4">
    <div>
      <h2 class="text-3xl font-bold text-uh-text md:text-5xl">Eksik Oyuncu Ilanlari</h2>
      <p class="mt-2 text-sm text-uh-muted">Aktif mac kadrolari icin uygun pozisyonlar.</p>
    </div>
    <label class="flex flex-col gap-2">
      <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Mevki Sec</span>
      <select class="h-11 w-[210px] rounded-btn border border-uh-border bg-uh-surface px-3 text-sm">
        <option>Tumu</option>
        <option>Kaleci</option>
        <option>Defans</option>
        <option>Orta Saha</option>
        <option>Forvet</option>
      </select>
    </label>
  </div>

  <div class="mt-6 overflow-hidden rounded-card border border-uh-border bg-uh-surface">
    <table class="w-full border-collapse">
      <thead class="bg-slate-600 text-left text-xs font-semibold tracking-[0.12em] text-white uppercase">
        <tr>
          <th class="px-4 py-3">Tarih / Saat</th>
          <th class="px-4 py-3">Saha Konumu</th>
          <th class="px-4 py-3">Yas Ortalamasi</th>
          <th class="px-4 py-3">Aranan Mevki</th>
          <th class="px-4 py-3 text-right">Islem</th>
        </tr>
      </thead>
      <tbody>
        {#each ads as ad}
          <tr class="border-t border-uh-border">
            <td class="px-4 py-4 text-sm md:text-base">{ad.dateTime}</td>
            <td class="px-4 py-4 text-sm md:text-base">{ad.venue}</td>
            <td class="px-4 py-4 text-sm md:text-base">{ad.age}</td>
            <td class="px-4 py-4 text-sm md:text-base">{ad.position}</td>
            <td class="px-4 py-4 text-right">
              <button type="button" class="rounded-btn border border-uh-border px-4 py-2 text-sm font-medium">
                Kadroya Katil
              </button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</section>
