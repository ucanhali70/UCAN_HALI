<script lang="ts">
  import { onMount } from "svelte";
  import BusinessDashboardPage from "./lib/ui/pages/BusinessDashboardPage.svelte";
  import Footer from "./lib/ui/layout/Footer.svelte";
  import Header from "./lib/ui/layout/Header.svelte";
  import LoginPage from "./lib/ui/pages/LoginPage.svelte";
  import MatchAdsPage from "./lib/ui/pages/MatchAdsPage.svelte";
  import ReservationGridPage from "./lib/ui/pages/ReservationGridPage.svelte";
  import RegisterPage from "./lib/ui/pages/RegisterPage.svelte";
  import SettingsPage from "./lib/ui/pages/SettingsPage.svelte";
  import VenueResultsPage from "./lib/ui/pages/VenueResultsPage.svelte";

  const USER_STORAGE_KEY = "ucan-hali-user";

  const missingPlayers = [
    { dateTime: "12 Ekim 2024 / 21:00", pitch: "Merkez Hali Saha", position: "Kaleci" },
    { dateTime: "13 Ekim 2024 / 20:00", pitch: "Karaman Arena", position: "Forvet" },
    { dateTime: "14 Ekim 2024 / 19:00", pitch: "Yildiz Spor Kompleksi", position: "Defans" }
  ];

  type AppPage = "home" | "venues" | "reservation" | "ads" | "business" | "login" | "register" | "settings";
  type SessionUser = { name: string; email: string };

  let currentPage: AppPage = "home";
  let currentUser: SessionUser | null = null;

  onMount(() => {
    const rawUser = localStorage.getItem(USER_STORAGE_KEY);
    if (!rawUser) {
      return;
    }

    try {
      currentUser = JSON.parse(rawUser) as SessionUser;
    } catch {
      localStorage.removeItem(USER_STORAGE_KEY);
    }
  });

  function persistUser(user: SessionUser | null) {
    if (!user) {
      localStorage.removeItem(USER_STORAGE_KEY);
      return;
    }

    localStorage.setItem(USER_STORAGE_KEY, JSON.stringify(user));
  }

  function navigate(page: AppPage) {
    currentPage = page;
  }

  function handleLogin(payload: SessionUser) {
    currentUser = payload;
    persistUser(payload);
    currentPage = "home";
  }

  function handleRegister(payload: SessionUser) {
    currentUser = payload;
    persistUser(payload);
    currentPage = "home";
  }

  function handleLogout() {
    currentUser = null;
    persistUser(null);
    currentPage = "home";
  }

  function handleOpenSettings() {
    currentPage = currentUser ? "settings" : "login";
  }

  const demoTabs: { id: AppPage; label: string }[] = [
    { id: "venues", label: "Tesis Sonuclari" },
    { id: "reservation", label: "Rezervasyon Grid" },
    { id: "business", label: "Isletme Paneli" }
  ];
</script>

<div class="min-h-screen bg-uh-bg">
  <Header
    currentPage={currentPage}
    isAuthenticated={Boolean(currentUser)}
    userName={currentUser?.name ?? ""}
    onNavigateHome={() => navigate("home")}
    onNavigateAds={() => navigate("ads")}
    onNavigateLogin={() => navigate("login")}
    onNavigateSettings={handleOpenSettings}
    onLogout={handleLogout}
  />

  <main class="pb-12">
    {#if currentPage === "home"}
      <section class="border-b border-uh-border bg-[linear-gradient(to_right,#f4f8f5_1px,transparent_1px),linear-gradient(to_bottom,#f4f8f5_1px,transparent_1px)] bg-[size:48px_48px]">
        <div class="mx-auto max-w-[1200px] px-4 py-14 text-center md:px-8 md:py-20">
          <h1 class="mx-auto max-w-3xl text-4xl leading-tight font-bold text-uh-text md:text-7xl">
            Hizli Saha Bul.
            <br />
            Eksik Oyuncuyu Tamamla.
          </h1>

          <div class="mx-auto mt-10 max-w-4xl rounded-card border border-uh-border bg-uh-surface p-4 md:p-6">
            <div class="grid grid-cols-1 gap-3 md:grid-cols-[1fr_1fr_auto]">
              <label class="flex flex-col gap-2 text-left">
                <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Tarih Secin</span>
                <input
                  type="text"
                  value="11/05/2026"
                  class="h-11 rounded-btn border border-uh-border px-3 text-sm outline-none focus:border-uh-primary"
                />
              </label>

              <label class="flex flex-col gap-2 text-left">
                <span class="text-xs font-semibold tracking-[0.12em] text-uh-muted uppercase">Saat Araligi</span>
                <select class="h-11 rounded-btn border border-uh-border px-3 text-sm outline-none focus:border-uh-primary">
                  <option>18:00 - 19:00</option>
                  <option>19:00 - 20:00</option>
                  <option>20:00 - 21:00</option>
                </select>
              </label>

              <button
                type="button"
                class="h-11 self-end rounded-btn bg-uh-primary px-6 text-sm font-semibold text-white hover:bg-uh-primary-700"
              >
                Saha Ara
              </button>
            </div>
          </div>
        </div>
      </section>

      <section class="mx-auto max-w-[1200px] px-4 py-10 md:px-8">
        <div class="mb-7 flex flex-wrap gap-2">
          {#each demoTabs as tab}
            <button
              type="button"
              class="rounded-btn border border-uh-border bg-white px-4 py-2 text-sm font-medium text-uh-text hover:border-uh-primary hover:text-uh-primary"
              on:click={() => navigate(tab.id)}
            >
              {tab.label}
            </button>
          {/each}
        </div>

        <h2 class="text-2xl font-bold text-uh-text md:text-4xl">Guncel Eksik Oyuncu Ilanlari</h2>
        <div class="mt-6 overflow-hidden rounded-card border border-uh-border bg-uh-surface">
          <table class="w-full border-collapse">
            <thead class="bg-uh-table-head text-left text-xs font-semibold tracking-[0.12em] text-white uppercase">
              <tr>
                <th class="px-4 py-3">Tarih / Saat</th>
                <th class="px-4 py-3">Saha Konumu</th>
                <th class="px-4 py-3">Aranan Mevki</th>
                <th class="px-4 py-3 text-right">Islem</th>
              </tr>
            </thead>
            <tbody>
              {#each missingPlayers as row}
                <tr class="border-t border-uh-border">
                  <td class="px-4 py-4 text-sm text-uh-text md:text-base">{row.dateTime}</td>
                  <td class="px-4 py-4 text-sm text-uh-text md:text-base">{row.pitch}</td>
                  <td class="px-4 py-4 text-sm text-uh-text md:text-base">{row.position}</td>
                  <td class="px-4 py-4 text-right">
                    <button
                      type="button"
                      class="rounded-btn border border-uh-border bg-uh-surface px-4 py-2 text-sm font-medium text-uh-text hover:border-uh-primary hover:text-uh-primary"
                    >
                      Kadroya Katil
                    </button>
                  </td>
                </tr>
              {/each}
            </tbody>
          </table>
        </div>
      </section>
    {:else if currentPage === "venues"}
      <VenueResultsPage />
    {:else if currentPage === "reservation"}
      <ReservationGridPage />
    {:else if currentPage === "business"}
      <BusinessDashboardPage />
    {:else if currentPage === "ads"}
      <MatchAdsPage />
    {:else if currentPage === "login"}
      <LoginPage onLogin={handleLogin} onGoRegister={() => navigate("register")} />
    {:else if currentPage === "register"}
      <RegisterPage onRegister={handleRegister} onGoLogin={() => navigate("login")} />
    {:else}
      <SettingsPage userName={currentUser?.name ?? "Oyuncu"} onBack={() => navigate("home")} />
    {/if}
  </main>

  <Footer />
</div>
