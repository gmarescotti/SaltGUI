send_services_alert:
  local.cmd.run:
    - tgt: 'ops-admin-server'   # può essere minion specifico che gestisce notifiche
    - arg:
      - "echo 'ALARM: {{ data['host'] }} {{ data['service'] }} is {{ data['status'] }}' >> /tmp/alerts.log"

