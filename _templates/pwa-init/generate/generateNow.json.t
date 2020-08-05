---
to: now.json
---
{
  "version": 1,
  "name": "qoala-starter-app",
  "alias": ["qoala-starter-app"],
  "scope": "qoala-tech",
  "builds": [
    {
      "src": "package.json",
      "use": "@now/static-build",
      "config": {
        "distDir": "dist"
      }
    }
  ],
  "github": {
    "enabled": true
  }
}
