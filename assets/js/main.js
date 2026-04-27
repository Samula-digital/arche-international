const menuButton = document.querySelector(".menu-toggle");
const navLinks = document.querySelector(".nav-links");
const slides = Array.from(document.querySelectorAll(".hero-slide"));

if (menuButton && navLinks) {
  menuButton.addEventListener("click", () => {
    const expanded = menuButton.getAttribute("aria-expanded") === "true";
    menuButton.setAttribute("aria-expanded", String(!expanded));
    navLinks.classList.toggle("is-open");
  });
}

if (slides.length > 1) {
  let current = 0;

  window.setInterval(() => {
    slides[current].classList.remove("is-active");
    current = (current + 1) % slides.length;
    slides[current].classList.add("is-active");
  }, 6000);
}
