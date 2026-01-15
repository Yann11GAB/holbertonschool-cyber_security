# 0. Welcome — Web Application Security

## Objective
Configure access to the target web application and verify connectivity before starting the pentest.

---

## Target Information
- Domain: `web0x00.hbtn`
- Endpoint: `http://web0x00.hbtn/login`
- Target IP: `10.42.158.32`

---

## 1) Domain Mapping

Append the domain to the hosts file as required by the instructions:

```bash
sudo bash -c "echo '10.42.158.32 web0x00.hbtn' >> /etc/hosts"

