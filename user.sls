{{ pillar['jeff']['username'] }}:
  user.present:
    - uid: {{ pillar['jeff']['uid'] }}
    - password: {{ pillar['jeff']['password'] }}
