provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

resource "cloudflare_zone_settings_override" "default" {
    name = "${var.cloudflare_domain}"
    settings {
        ssl = "full"
        always_online = "on"
        always_use_https = "on"
    }
}

resource "cloudflare_record" "docker" {
  domain  = "${var.cloudflare_domain}"
  name    = "docker"
  value   = "${google_compute_address.default.address}"
  type    = "A"
  ttl     = 1
  proxied = true
}
