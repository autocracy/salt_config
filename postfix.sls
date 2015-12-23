postfix:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: postfix
      - file: /etc/postfix/main.cf
      - file: /etc/aliases
    - watch:
      - file: /etc/postfix/main.cf

/etc/postfix/main.cf:
  file.managed:
    - source: salt://configs/mail/main.cf
    - template: jinja
    - require:
      - pkg: postfix

/etc/aliases:
  file.managed:
    - contents_pillar: aliases
    - require:
      - pkg: postfix
