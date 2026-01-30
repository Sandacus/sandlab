(function () {
  const root = document.documentElement;
  const storageKey = "theme";
  const btn = document.querySelector(".theme-toggle");

  function getPreferredTheme() {
    const stored = localStorage.getItem(storageKey);
    if (stored === "light" || stored === "dark") return stored;
    // no stored choice -> follow system
    return window.matchMedia("(prefers-color-scheme: light)").matches
      ? "light"
      : "dark";
  }

  function applyTheme(theme, persist) {
    if (theme === "light") root.setAttribute("data-theme", "light");
    else root.setAttribute("data-theme", "dark");

    // Optional: help form controls match theme in supported browsers
    root.style.colorScheme = theme;

    if (persist) localStorage.setItem(storageKey, theme);
  }

  // Set on load
  applyTheme(getPreferredTheme(), false);

  if (btn) {
    btn.addEventListener("click", function () {
      const current = root.getAttribute("data-theme") || getPreferredTheme();
      const next = current === "light" ? "dark" : "light";
      applyTheme(next, true);
    });
  }

  // If user hasn't chosen, keep in sync with OS changes
  const media = window.matchMedia("(prefers-color-scheme: light)");
  media.addEventListener?.("change", () => {
    const stored = localStorage.getItem(storageKey);
    if (stored) return; // user has explicit choice
    applyTheme(getPreferredTheme(), false);
  });
})();
