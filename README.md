# Demo of `bundle install` misbehaving on Ubuntu 18.04 with chef_gem's installed

This repo demonstrates a bug I'm encountering where running `bundle
install` on Ubuntu 18.04 when a chef gem has been installed fails because
it can't write to `/home/vagrant/.bundle`. On every other platform
`/home/vagrant/.bundle` is still not owned by `vagrant` but it doesn't
seem to matter because they all converge successfully. I've committed the
relevant logs but in summary:

```
$ for kitchen_yaml in .kitchen*.yml
  do
    if [[ -f "$kitchen_yaml" ]]
      then KITCHEN_YAML=${kitchen_yaml##*/} kitchen test -d always --concurrency=4
      rm -rvf .kitchen."$kitchen_yaml"
      cp -rv .kitchen{,"$kitchen_yaml"}
    fi
  done; grep -- '>>>>>>     Converge failed on instance' .kitchen.kitchen-*/logs/kitchen.log
…
.kitchen.kitchen-chef12.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-vagrant-1804>.  Please see .kitchen/logs/test-vagrant-1804.log for more details
.kitchen.kitchen-chef12.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-ubuntu-1804>.  Please see .kitchen/logs/test-ubuntu-1804.log for more details
.kitchen.kitchen-chef13.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-vagrant-1804>.  Please see .kitchen/logs/test-vagrant-1804.log for more details
.kitchen.kitchen-chef13.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-ubuntu-1804>.  Please see .kitchen/logs/test-ubuntu-1804.log for more details
.kitchen.kitchen-chef14.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-ubuntu-1804>.  Please see .kitchen/logs/test-ubuntu-1804.log for more details
.kitchen.kitchen-chef14.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-vagrant-1804>.  Please see .kitchen/logs/test-vagrant-1804.log for more details
.kitchen.kitchen-chef15.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-ubuntu-1804>.  Please see .kitchen/logs/test-ubuntu-1804.log for more details
.kitchen.kitchen-chef15.yml/logs/kitchen.log:>>>>>>     Converge failed on instance <test-vagrant-1804>.  Please see .kitchen/logs/test-vagrant-1804.log for more details
```

Any help is greatly appreciated.
