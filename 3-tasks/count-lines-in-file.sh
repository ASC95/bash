#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

count_lines_in_massive_file() {
    wc -l "${HOME}/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/base_plus_attack1a_scada.csv" # 48,600,001
    wc -l "${HOME}/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/powernet_39_scada.csv" # 5,567,400
}

count_lines_in_massive_file