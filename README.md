# Demo of `bundle install` misbehaving on bento/ubuntu-18.04 with chef_gem's installed

This repo demonstrates a bug I'm encountering where running `bundle
install` on Ubuntu 18.04 when a chef gem has been installed fails because
it can't write to `/home/vagrant/.bundle`. On every other platform
`/home/vagrant/.bundle` is still not owned by `vagrant` but it doesn't
seem to matter because they all converge successfully. I've committed the
relevant logs but in summary:

```
$ kitchen test -d never --concurrency=6
…
>>>>>> ------Exception-------
>>>>>> Class: Kitchen::ActionFailed
>>>>>> Message: 1 actions failed.
>>>>>>     Converge failed on instance <test-vagrant-1804>.  Please see .kitchen/logs/test-vagrant-1804.log for more details
>>>>>> ----------------------
>>>>>> Please see .kitchen/logs/kitchen.log for more details
```

Any help is greatly appreciated.
