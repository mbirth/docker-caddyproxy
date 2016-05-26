Caddyserver Proxy
=================

This is a Docker image with a bare-bones [Caddyserver](https://caddyserver.com/).

It is meant to function as an SSL proxy to your intranet web services.


Caddyfiles
----------

Usually, Caddyserver only supports one single `Caddyfile` for configuration. This
Docker image contains a script which gathers all `*.caddy` files from the
`/data/caddy.d/` directory and concatenates them into one `Caddyfile` before
launching the server.

This way you can keep your configuration clean.


Example
-------

Here is a simple example to proxy my Subsonic via SSL:

```
subsonic.myhost.com {
    proxy / http://homeserver:4040/ {
        proxy_header Host subsonic.myhost.com
        proxy_header Scheme https
        # Enable if needed, e.g. for Wetty:
        #websocket
    }
}
```

This will accept HTTPS connections to subsonic.myhost.com on port 443 and
forward them to http://homeserver:4040/.

Make sure that each of your configured services has a unique hostname so
that Caddyserver can distinguish them.


Environment Variables
---------------------

* `CADDY_ARCH` --- CPU architecture to use for Caddy, e.g. `386` or `arm`. Default: `amd64`
* `DEFAULT_EMAIL` --- The default email address to use for SSL certificate generation.
  Can be overridden in Caddyfiles with the `tls` directive.


Volumes
-------

* `/data` --- holds the Caddyfiles and Logfile.
