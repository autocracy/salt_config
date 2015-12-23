dovecot-imapd:
  pkg:
    - installed

dovecot:
  service.running:
    - require:
      - file: /etc/dovecot/dovecot.conf
      - pkg: dovecot-imapd
    - watch:
      - file: /etc/dovecot/dovecot.conf

/etc/dovecot/dovecot.conf:
  file.managed:
    - source: salt://configs/mail/dovecot.conf
    - require:
      - pkg: dovecot-imapd
