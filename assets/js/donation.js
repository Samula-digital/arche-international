const paymentConfig = window.ArchePayments || {};
const providerLabels = {
  stripe: "Give by Card / Bank",
  paypal: "Give with PayPal",
  hostedForm: "Open Giving Form",
};

document.querySelectorAll("[data-provider]").forEach((card) => {
  const provider = card.getAttribute("data-provider");
  const link = card.querySelector("[data-payment-link]");
  const url = paymentConfig[provider];

  if (!link) return;

  if (url) {
    card.classList.add("active");
    link.href = url;
    link.textContent = providerLabels[provider] || "Give Online";
    link.target = "_blank";
    link.rel = "noopener";
    return;
  }

  card.classList.add("pending");
  link.href = "contact.html";
  link.textContent = "Contact To Give";
});
