base:
  '*':
    - basic
{%- if grains.os != 'MacOS' %}
    - user
    - ssh
{% endif %}
  'karl.storyinmemo.com':
    - postfix
    - dovecot
  'raspberry.storyinmemo.com':
    - saltmaster
