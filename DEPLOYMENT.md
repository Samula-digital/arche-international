# Deployment

Live site:

```text
https://samula-digital.github.io/arche-international/
```

GitHub repository:

```text
https://github.com/Samula-digital/arche-international
```

## Auto Deploy

This project can run a local watcher that commits and pushes changes to `main`.
GitHub Pages then rebuilds the public site automatically.

Start it from this folder:

```bash
./scripts/auto-deploy.sh
```

Or start it in the background:

```bash
nohup ./scripts/auto-deploy.sh > .auto-deploy.log 2>&1 & echo $! > .auto-deploy.pid
```

Stop the background watcher:

```bash
kill "$(cat .auto-deploy.pid)"
rm -f .auto-deploy.pid .auto-deploy.lock
```

GitHub Pages is usually fast, but public updates may take about 30-90 seconds after each push.
