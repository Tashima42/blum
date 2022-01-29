# Blum, super simple CLI bluetooth manager
Blum will just help you to connect to bluetooth devices without having to remember their mac address using `bluetoothctl`

## Installation
Attention: Always inspect scripts before running

```
curl https://raw.githubusercontent.com/Tashima42/blum/main/blum.sh > ~/.local/bin/blum && sudo chmod +x ~/.local/bin/blum 
```
If you have this error `bash: pomo: command not found`
  * Add `~/.local/bin` to your path with
  * echo `'export PATH=$PATH:$HOME/.local/bin' >> .bashrc`

Uninstall:
```
sudo rm ~/.local/bin/blum && rm $HOME/.config/.blum
```


## Examples
* Save a device
  ```
  blum add buds A0:AC:69:16:81:B8
  ```
* Connect to a device
  ```
  blum connect buds
  ```
* List devices
  ```
  blum list
  ```
* Remove a device
  ```
  blum remove buds
  ```
* Edit a device
  ```
  blum edit buds A1:D2:06:88:2D:D9
  ```

## Usage
```
Usage: blum {help|connect|list|add|remove|edit}
Examples:
    List:      blum list
    Connect:   blum connect $name
    Add:       blum add $name $mac
    Remove:    blum remove $name
    Edit:      blum edit $name $mac
```
