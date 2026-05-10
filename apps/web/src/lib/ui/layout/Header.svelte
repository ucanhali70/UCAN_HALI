<script lang="ts">
  type AppPage = "home" | "ads" | "venues" | "reservation" | "business" | "login" | "register" | "settings";

  let {
    brand = "Ucan Hali",
    location = "Karaman",
    currentPage = "home",
    isAuthenticated = false,
    userName = "",
    onNavigateHome = () => {},
    onNavigateAds = () => {},
    onNavigateLogin = () => {},
    onNavigateSettings = () => {},
    onLogout = () => {}
  } = $props<{
    brand?: string;
    location?: string;
    currentPage?: AppPage;
    isAuthenticated?: boolean;
    userName?: string;
    onNavigateHome?: () => void;
    onNavigateAds?: () => void;
    onNavigateLogin?: () => void;
    onNavigateSettings?: () => void;
    onLogout?: () => void;
  }>();

  let userMenuEl = $state<HTMLDetailsElement | null>(null);

  function handleNavigateSettings() {
    if (userMenuEl) {
      userMenuEl.open = false;
    }
    onNavigateSettings();
  }

  function handleLogout() {
    if (userMenuEl) {
      userMenuEl.open = false;
    }
    onLogout();
  }
</script>

<header class="border-b border-uh-border bg-uh-surface">
  <div class="mx-auto flex h-18 w-full max-w-[1200px] items-center px-4 md:px-8">
    <button type="button" class="text-2xl font-bold text-uh-primary" onclick={onNavigateHome}>
      {brand}
    </button>

    <span class="ml-4 hidden rounded-btn border border-uh-border px-3 py-2 text-sm text-uh-muted md:inline-flex">
      {location}
    </span>

    <nav aria-label="Main navigation" class="ml-auto">
      <ul class="flex items-center gap-5 text-lg md:gap-7">
        <li>
          <button
            type="button"
            onclick={onNavigateAds}
            class={`border-b-2 pb-1 font-medium transition-colors ${
              currentPage === "ads" ? "border-uh-primary text-uh-primary" : "border-transparent text-uh-text hover:text-uh-primary"
            }`}
          >
            Mac Ilanlari
          </button>
        </li>
        <li>
          {#if isAuthenticated}
            <details class="relative" bind:this={userMenuEl}>
              <summary class="list-none border-b-2 border-transparent pb-1 font-medium text-uh-text hover:text-uh-primary">
                {userName}
              </summary>
              <div class="absolute right-0 z-20 mt-3 w-44 rounded-card border border-uh-border bg-white p-2 shadow-lg">
                <button
                  type="button"
                  onclick={handleNavigateSettings}
                  class="w-full rounded-btn px-3 py-2 text-left text-sm text-uh-text hover:bg-uh-bg"
                >
                  Ayarlar
                </button>
                <button
                  type="button"
                  onclick={handleLogout}
                  class="mt-1 w-full rounded-btn px-3 py-2 text-left text-sm text-uh-text hover:bg-uh-bg"
                >
                  Cikis Yap
                </button>
              </div>
            </details>
          {:else}
            <button
              type="button"
              onclick={onNavigateLogin}
              class={`border-b-2 pb-1 font-medium transition-colors ${
                currentPage === "login" || currentPage === "register"
                  ? "border-uh-primary text-uh-primary"
                  : "border-transparent text-uh-text hover:text-uh-primary"
              }`}
            >
              Giris Yap
            </button>
          {/if}
        </li>
      </ul>
    </nav>
  </div>
</header>
