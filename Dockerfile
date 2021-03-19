FROM ubuntu:16.04

# Install some deps
RUN apt-get update && apt-get install -y wget
#        && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
#        && echo '7e35a63f9db14f93ec7feeb0fce76b30c08f2057 wkhtmltox.deb' | sha1sum -c - \
#        && apt-get install -y --no-install-recommends ./wkhtmltox.deb \
#        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb

RUN wget -O - https://nightly.odoo.com/odoo.key | apt-key add - \
        && echo "deb http://nightly.odoo.com/10.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list \
        && apt-get update && apt-get install -y odoo

# Expose Odoo services
EXPOSE 8069 8071 8072

COPY ./odoo.conf /etc/odoo/

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
