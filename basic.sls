{%- if grains.os == "MacOS" %}
{%- for package in [
  'coreutils',
  'findutils',
  'gnu-tar',
  'gnu-sed',
  'gawk',
  'gnupg2',
  'gnutls',
  'gnu-indent',
  'gnu-getopt',
  'mobile-shell',
  'saltstack',
  ] %}
{{ package }}:
  pkg:
    - installed
{%- endfor %}

{%- else %}
{%- if grains.os == "CentOS" %}
epel-release:
  pkg.installed
{% endif %}
{%- for package in [
  'atop',
  'chrony',
  'fail2ban',
  'git',
  'gnupg2',
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
    - text: alias gpg=gpg2
