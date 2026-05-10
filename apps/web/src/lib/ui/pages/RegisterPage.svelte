<script lang="ts">
  let {
    onRegister = (_payload: { name: string; email: string }) => {},
    onGoLogin = () => {}
  } = $props<{
    onRegister?: (payload: { name: string; email: string }) => void;
    onGoLogin?: () => void;
  }>();

  let fullName = $state("");
  let email = $state("");
  let password = $state("");
  let confirmPassword = $state("");
  let errorMessage = $state("");

  function handleSubmit() {
    if (!fullName || !email || !password || !confirmPassword) {
      errorMessage = "Tum alanlari doldurman gerekiyor.";
      return;
    }

    if (password !== confirmPassword) {
      errorMessage = "Sifreler ayni olmali.";
      return;
    }

    errorMessage = "";
    onRegister({ name: fullName, email });
  }
</script>

<section class="mx-auto max-w-[560px] px-4 py-10 md:py-14">
  <div class="rounded-card border border-uh-border bg-white p-6 md:p-8">
    <h1 class="text-4xl font-bold text-uh-text">Kaydol</h1>
    <p class="mt-2 text-sm text-uh-muted">Yeni hesap olusturarak platformu kullanmaya basla.</p>

    <div class="mt-6 space-y-4">
      <label class="flex flex-col gap-2">
        <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Ad Soyad</span>
        <input
          type="text"
          bind:value={fullName}
          placeholder="Ad Soyad"
          class="h-11 rounded-btn border border-uh-border px-3 text-sm outline-none focus:border-uh-primary"
        />
      </label>

      <label class="flex flex-col gap-2">
        <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Email</span>
        <input
          type="email"
          bind:value={email}
          placeholder="ornek@mail.com"
          class="h-11 rounded-btn border border-uh-border px-3 text-sm outline-none focus:border-uh-primary"
        />
      </label>

      <label class="flex flex-col gap-2">
        <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Sifre</span>
        <input
          type="password"
          bind:value={password}
          class="h-11 rounded-btn border border-uh-border px-3 text-sm outline-none focus:border-uh-primary"
        />
      </label>

      <label class="flex flex-col gap-2">
        <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Sifre Tekrar</span>
        <input
          type="password"
          bind:value={confirmPassword}
          class="h-11 rounded-btn border border-uh-border px-3 text-sm outline-none focus:border-uh-primary"
        />
      </label>
    </div>

    {#if errorMessage}
      <p class="mt-4 text-sm font-medium text-red-700">{errorMessage}</p>
    {/if}

    <button
      type="button"
      onclick={handleSubmit}
      class="mt-6 h-11 w-full rounded-btn bg-uh-primary px-4 text-sm font-semibold text-white hover:bg-uh-primary-700"
    >
      Hesap Olustur
    </button>

    <p class="mt-5 text-sm text-uh-muted">
      Hesabin var mi?
      <button type="button" onclick={onGoLogin} class="font-semibold text-uh-primary">Giris Yap</button>
    </p>
  </div>
</section>
