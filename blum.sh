#! /bin/bash

CONFIG_FILE=$HOME/.config/.blum

function add_device() {
  name=$1
  mac=$2 
  echo "$name $mac" >> $CONFIG_FILE
}

function remove_device() {
  name=$1
  sed -i "/$name/d" $CONFIG_FILE
}

function edit_device() {
  name=$1
  mac=$2
  remove_project $name
  add_project $name $mac
}

function list_devices() {
  while read p; do
    name=$(echo "$p" | awk '{print $1}')
    mac=$(echo "$p" | awk '{print $2}')
    if [[ ! -z "$name" ]];then 
      echo "$name = $mac"
    fi
  done <$CONFIG_FILE
}

function connect() {
  connect_name=$1
  while read p; do
    name=$(echo "$p" | awk '{print $1}')
    mac=$(echo "$p" | awk '{print $2}')
    if [[ "$name" == "$connect_name" ]];then 
      bluetoothctl power on
      bluetoothctl connect $mac
    fi
  done <$CONFIG_FILE
}

function help_message() {
  echo "Usage: blum {help|connect|list|add|remove|edit}
Examples:
    List:      blum list
    Connect:   blum connect \$name
    Add:       blum add \$name \$mac
    Remove:    blum remove \$name
    Edit:      blum edit \$name \$mac"
}

default_message="try: 'blum help' for instructions"

for i in "$@"; do
  case $i in
    help)
      help_message
      exit 0
      ;;
    connect)
      connect $2
      exit 0
      ;;
    list)
      list_devices
      exit 0
      ;;
    add)
      add_device $2 $3
      exit 0
      ;;
    remove)
      remove_device $2
      exit 0
      ;;
    edit)
      edit_device $2 $3
      exit 0
      ;;
    *)
      help_message
      exit 0
      ;;
  esac
done

echo $default_message
exit 0
