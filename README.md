[![Build Status](https://kiri2lov.semaphoreci.com/badges/numberator/branches/master.svg?style=shields)](https://kiri2lov.semaphoreci.com/projects/numberator)

# README

How to install:

```
git clone git@github.com:kiri2lov/numberator.git
cd numberator
gem build numberator.gemspec
gem install numberator-0.1.0.gem
```

How to use:

```
echo 'aa 23 a2 441' | numberator 2
head -c 50M < /dev/urandom | numberator 10
```
