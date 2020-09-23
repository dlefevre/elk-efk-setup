#!/bin/bash

case $1 in
  start)
    ansible -f 25 -i inventory workload -m shell -a "cd soap-traffic-generator && nohup ./generator.py &"
    ;;
  stop)
    ansible -f 25 -i inventory workload -m shell -a "cd soap-traffic-generator && ./generator.py --threads=-1"
    ;;
  threads)
    ansible -f 25 -i inventory workload -m shell -a "cd soap-traffic-generator && ./generator.py --threads=$2"
    ;;
  *)
    echo "Unknown command. Use: start, stop, threads"
    ;;
esac
