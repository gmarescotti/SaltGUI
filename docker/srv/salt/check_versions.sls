check_versions:
  cmd.run:
    - name: |
        echo "Minion: $(hostname)"
        echo "filebeat: $(dpkg-query -W -f='${Version}' filebeat 2>/dev/null || echo not installed)"
        echo "metricbeat: $(dpkg-query -W -f='${Version}' metricbeat 2>/dev/null || echo not installed)"
