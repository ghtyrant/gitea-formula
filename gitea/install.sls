# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "gitea/map.jinja" import gitea with context %}

git_group:
  group.present:
    - name: git
    - system: True

git:
  user.present:
    - name: git
    - system: True
    - home: /var/lib/gitea
    - shell: /usr/sbin/nologin
    - groups:
      - git
  pkg.installed: []

/var/lib/gitea/gitea:
  file.managed:
    - source: "https://dl.gitea.io/gitea/{{ gitea.version }}/gitea-{{ gitea.version }}-linux-amd64"
    - source_hash: "https://dl.gitea.io/gitea/{{ gitea.version }}/gitea-{{ gitea.version }}-linux-amd64.sha256"
    - user: git
    - group: git
    - mode: 750
    - require:
      - git
