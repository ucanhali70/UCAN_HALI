<script lang="ts">
  let {
    brand = "Ucan Hali",
    copyright = "© 2024 Ucan Hali. Academic Minimalism in Sports Logistics.",
    links = [
      { label: "Gizlilik Politikasi" },
      { label: "Kullanim Kosullari" },
      { label: "Iletisim" }
    ]
  } = $props<{
    brand?: string;
    copyright?: string;
    links?: { label: string }[];
  }>();
</script>

<footer class="border-t border-uh-border bg-uh-surface">
  <div
    class="mx-auto flex w-full max-w-[1200px] flex-col gap-4 px-4 py-5 text-sm text-uh-muted md:flex-row md:items-center md:justify-between md:px-8"
  >
    <div class="flex flex-col gap-2 md:flex-row md:items-center md:gap-8">
      <span class="text-base font-semibold text-uh-text">{brand}</span>
      <span>{copyright}</span>
    </div>

    <ul class="flex flex-wrap items-center gap-4">
      {#each links as link}
        <li>
          <button type="button" class="hover:text-uh-primary">{link.label}</button>
        </li>
      {/each}
    </ul>
  </div>
</footer>
