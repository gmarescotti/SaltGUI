{% set services = [ "smartmontools", "autossh-tunnel", "filebeat", "mariadb", "mdmonitor", "metricbeat", "mongod", "systemd-hostnamed" ] %}

{% for svc in services %}

check_{{ svc }}:
  cmd.run:
    - name: systemctl is-active {{ svc }}
    - stateful: True
    - onchanges:
      - module: send_alarm_{{ svc }}

send_alarm_{{ svc }}:
  module.run:
    - name: event.send
    - tag: system/alarm
    - data:
        host: {{ grains['id'] }}
        service: {{ svc }}
        status: DOWN
    - unless: "systemctl is-active {{ svc }} | grep active"

{% endfor %}

