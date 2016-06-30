postgrey:
  pkg:
    - installed
  service:
    - running

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

update-aliases:
  cmd.wait:
    - name: newaliases
    - watch:
      - file: /etc/aliases

/etc/postfix/access:
  file.managed:
    - contents_pillar: postfix_access
    - require:
      - pkg: postfix

update-access:
  cmd.wait:
    - name: postmap /etc/postfix/access
    - watch:
      - file: /etc/postfix/access

# TODO create array of dict with source, output, and map commands...
/etc/postfix/sender_access:
  file.managed:
    - contents_pillar: postfix_sender_access
    - require:
      - pkg: postfix

update-sender-access:
  cmd.wait:
    - name: postmap /etc/postfix/sender_access
    - watch:
      - file: /etc/postfix/sender_access
