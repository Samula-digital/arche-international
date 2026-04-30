# Payment Setup

The website is static and hosted on GitHub Pages, so it should not collect card or bank details directly.
Use a hosted donation/payment page from a provider, then paste the public URL into:

```text
assets/js/payment-config.js
```

## Current Config

```js
window.ArchePayments = {
  stripe: "",
  paypal: "",
  hostedForm: "",
};
```

## How To Enable A Button

1. Create a hosted payment/donation link with your provider.
2. Copy the public checkout/donation URL.
3. Paste it into the matching field.

Examples:

```js
window.ArchePayments = {
  stripe: "https://buy.stripe.com/your-payment-link",
  paypal: "https://www.paypal.com/donate/?hosted_button_id=YOUR_ID",
  hostedForm: "https://givebutter.com/your-campaign",
};
```

Do not put API keys, secret keys, passwords, or private tokens in this repository.

## Provider Notes

- Stripe Payment Links are hosted checkout links.
- PayPal Donate buttons are hosted donation links.
- Givebutter and Donorbox provide hosted nonprofit donation forms.

Official references:

- Stripe Payment Links: `https://docs.stripe.com/payments/payment-links`
- PayPal Donate button: `https://www.paypal.com/us/webapps/mpp/non-profits/fundraising/donate-button`
- Givebutter donation forms/widgets: `https://help.givebutter.com/en/collections/3855406-donation-forms`
- Donorbox donation forms: `https://donorbox.org/explore/donation-forms/`

## Recommended Launch Step

Create one official hosted donation page first, connect it as the primary button, then add the other options later if needed.
