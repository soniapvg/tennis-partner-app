"use strict";

{ 
  const toggle = document.querySelector("[data-action='toggle-theme']");

  function getUserTheme() {
    let storedTheme = localStorage.getItem('theme') || (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    if (storedTheme) {
      document.documentElement.setAttribute('data-theme', storedTheme);
    }
  }

  function setTheme() {
    let currentTheme = document.documentElement.getAttribute("data-theme");
    let targetTheme = "light";

    if (currentTheme === "light") {
        targetTheme = "dark";
    }

    document.documentElement.setAttribute('data-theme', targetTheme)
    localStorage.setItem('theme', targetTheme);
  }

  // window.addEventListener('DOMContentLoaded', () => getUserTheme());
  // toggle.addEventListener('click', () => setTheme());
}
