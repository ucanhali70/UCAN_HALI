<script lang="ts">
  let {
    onLogin = (_payload: { name: string; email: string }) => {},
    onGoRegister = () => {}
  } = $props<{
    onLogin?: (payload: { name: string; email: string }) => void;
    onGoRegister?: () => void;
  }>();

  let email = $state("");
  let password = $state("");
  let errorMessage = $state("");

  function handleSubmit() {
    if (!email || !password) {
      errorMessage = "Email ve sifre zorunlu.";
      return;
    }

    errorMessage = "";
    const nameFromEmail = email.split("@")[0] || "Oyuncu";
    const normalizedName = nameFromEmail.charAt(0).toUpperCase() + nameFromEmail.slice(1);
    onLogin({ name: normalizedName, email });
  }
</script>

<section class="mx-auto max-w-[560px] px-4 py-10 md:py-14">
  <div class="rounded-card border border-uh-border bg-white p-6 md:p-8">
    <h1 class="text-4xl font-bold text-uh-text">Giris Yap</h1>
    <p class="mt-2 text-sm text-uh-muted">Hesabina giris yaparak mac ilanlarini yonet.</p>

    <div class="mt-6 space-y-4">
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
          placeholder="********"
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
      Giris Yap
    </button>

    <p class="mt-5 text-sm text-uh-muted">
      Hesabin yok mu?
      <button type="button" onclick={onGoRegister} class="font-semibold text-uh-primary">Kaydol</button>
    </p>
  </div>
</section>
