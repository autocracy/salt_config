{%- if grains.os == "MacOS" %}
{%- for package in [
  'saltstack',
  'mobile-shell',
  ] %}
{{ package }}:
  pkg:
    - installed
{%- endfor %}
{%- else %}
{%- for package in [
  'atop',
  'chrony',
  'git',
  'make',
  'mosh',
  'salt-minion',
  'screen',
  'vim',
  ] %}
{{ package }}:
  pkg:
    - installed
{%- endfor %}
{%- endif %}

/etc/salt/minion:
  file.managed:
    - contents: |
        master: salt.storyinmemo.com
        ipv6: True

/etc/profile:
  file.append:
    - text: export EDITOR=vim
