# just 32-bit x86 installer used for now. x64 was introduced at ver. 7.0, but most plugins are still only 32-bit.
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for version in ['7.6.6', '7.6.4', '7.6.3', '7.6.2', '7.6.1', '7.5.9', '7.5.8', '7.5.7', '7.5.6', '7.5.5', '7.5.4', '7.5.3', '7.5.2', '7.5.1', '7.4.2'] %}
  {% set maj_version = version[0] ~ '.x' %}
  '{{ version }}':
    full_name: 'Notepad++ (32-bit x86)'
    installer: 'https://notepad-plus-plus.org/repository/{{ maj_version }}/{{ version }}/npp.{{ version }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
# the 64-bit installer is available from:
# https://notepad-plus-plus.org/repository/7.x/7.5.8/npp.7.5.8.Installer.x64.exe
