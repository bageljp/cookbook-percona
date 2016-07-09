What's ?
===============
chef で使用する Percona の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "percona", git: "https://github.com/bageljp/cookbook-percona.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "percona" => {
    "mysql" => {
      "user" => "zabbix",
      "password" => "zabbix",
      "root" => {
        "user" => "root",
        "password" => "root-pass"
      }
    }
  }
)
```

Recipes
----------

#### percona::default
perconaのリポジトリ追加。

#### percona::zabbix
zabbix用のpercona設定。

Attributes
----------

主要なやつのみ。

