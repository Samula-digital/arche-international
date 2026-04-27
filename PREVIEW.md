# Public Preview

Current public preview URL:

```text
https://arche-international-live.loca.lt/
```

This URL points to the local files in this folder while these two processes are running on this Mac:

```bash
npx --yes browser-sync start --server . --files '*.html,assets/css/*.css,assets/js/*.js' --host 0.0.0.0 --port 5175 --no-open --no-notify
npx --yes localtunnel --port 5175 --subdomain arche-international-live
```

## Behavior

- Colleagues can view the site from anywhere using the preview URL.
- Changes to the HTML/CSS/JS files should auto-reload in the browser.
- The URL is stable as long as the localtunnel subdomain is available and the tunnel is running.
- If the Mac sleeps, disconnects, or the terminal process stops, the preview goes offline.

## For A True Permanent URL

Use one of these:

- GitHub Pages for a simple static site.
- Netlify or Vercel for automatic deploys from GitHub.
- Cloudflare Pages for static hosting.
- Cloudflare Tunnel or ngrok with a reserved domain if you need a permanent URL pointing to the local machine.
