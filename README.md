---

#  upload-to-consul-kv

A lightweight Python tool that watches a file (like an SSH public key) and uploads its content to a specified key in the Consul KV store whenever the file changes. Ideal for dynamic secrets/configuration sharing in distributed systems.

---

##  Features

*  Monitors a file continuously for changes (e.g. SSH public key)
*  Automatically uploads the new content to Consul KV on change
*  Customizable via CLI arguments (file path, key, Consul URL, ACL token, etc.)
*  Lightweight and easy to run in the background
*  Useful for certificate/key distribution pipelines

---

##  Requirements

* Python 3.x
* `requests` library (install via `pip install requests`)

---

##  Usage

```bash
Customise the variables inside the python file according to your use.
```
---

##  Example Use Cases

* Upload your SSH public key (`id_rsa.pub`) to Consul automatically when it changes.
* Share configuration files dynamically with other services using Consul KV.
* Automate updates of CA public keys in distributed infrastructure.

---

##  Notes

* The script will continuously run and monitor the file until manually stopped (e.g. Ctrl+C).
* If the file is deleted and recreated, it will detect and re-upload the new version.
* If using this inside a Docker container, make sure the file path is volume-mounted from the host.

---

##  Best Practices

* Use this script with systemd, supervisor, or a background job runner for long-running usage.
* Always secure your ACL token and avoid committing it to version control.
* Use meaningful Consul KV key names for better organization (e.g. `env/prod/ca/public-key`).

---

##  Testing the Upload

To test if the key was uploaded correctly:

```bash
curl http://localhost:8500/v1/kv/ca/pub-key/id_rsa.pub?raw
```

---

