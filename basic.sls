{%- for package in
  [ 'vim',
    'ntp',
    'git',
    'make',
    'screen',
    'atop',
    'salt-minion',
  ] %}
{{ package }}:
  pkg:
    - installed
{%- endfor %}

/etc/salt/minion:
  file.managed:
    - contents: |
        master: salt.storyinmemo.com
        ipv6: True

/etc/profile:
  file.append:
    - text: export EDITOR=vim
