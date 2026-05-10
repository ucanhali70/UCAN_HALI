<script lang="ts">
  let {
    userName = "",
    onBack = () => {}
  } = $props<{
    userName?: string;
    onBack?: () => void;
  }>();

  let currentPassword = $state("");
  let newPassword = $state("");
  let confirmPassword = $state("");
  let resultMessage = $state("");
  let resultType = $state<"success" | "error">("success");

  function handlePasswordChange() {
    if (!currentPassword || !newPassword || !confirmPassword) {
      resultType = "error";
      resultMessage = "Tum sifre alanlarini doldur.";
      return;
    }

    if (newPassword !== confirmPassword) {
      resultType = "error";
      resultMessage = "Yeni sifreler birbiriyle ayni olmali.";
      return;
    }

    resultType = "success";
    resultMessage = "Sifren degistirildi. (Demo mod)";
    currentPassword = "";
    newPassword = "";
    confirmPassword = "";
  }
</script>

<section class="mx-auto max-w-[640px] px-4 py-10 md:py-14">
  <div class="rounded-card border border-uh-border bg-white p-6 md:p-8">
    <div class="flex items-center justify-between gap-4">
      <div>
        <h1 class="text-4xl font-bold text-uh-text">Ayarlar</h1>
        <p class="mt-2 text-sm text-uh-muted">{userName} icin hesap ayarlari</p>
      </div>
      <button type="button" onclick={onBack} class="rounded-btn border border-uh-border px-4 py-2 text-sm font-medium">
        Geri Don
      </button>
    </div>

    <div class="mt-8 rounded-card border border-uh-border bg-uh-bg p-5">
      <h2 class="text-2xl font-bold text-uh-text">Sifre Degistir</h2>
      <div class="mt-4 space-y-4">
        <label class="flex flex-col gap-2">
          <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Mevcut Sifre</span>
          <input
            type="password"
            bind:value={currentPassword}
            class="h-11 rounded-btn border border-uh-border bg-white px-3 text-sm outline-none focus:border-uh-primary"
          />
        </label>

        <label class="flex flex-col gap-2">
          <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Yeni Sifre</span>
          <input
            type="password"
            bind:value={newPassword}
            class="h-11 rounded-btn border border-uh-border bg-white px-3 text-sm outline-none focus:border-uh-primary"
          />
        </label>

        <label class="flex flex-col gap-2">
          <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Yeni Sifre Tekrar</span>
          <input
            type="password"
            bind:value={confirmPassword}
            class="h-11 rounded-btn border border-uh-border bg-white px-3 text-sm outline-none focus:border-uh-primary"
          />
        </label>
      </div>

      {#if resultMessage}
        <p class={`mt-4 text-sm font-medium ${resultType === "success" ? "text-emerald-700" : "text-red-700"}`}>
          {resultMessage}
        </p>
      {/if}

      <button
        type="button"
        onclick={handlePasswordChange}
        class="mt-6 h-11 rounded-btn bg-uh-primary px-6 text-sm font-semibold text-white hover:bg-uh-primary-700"
      >
        Sifreyi Guncelle
      </button>
    </div>
  </div>
</section>
