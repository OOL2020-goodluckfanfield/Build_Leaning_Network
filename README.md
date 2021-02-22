# Build_Leaning_Network
OOL2020-goodluckfanfield

## 動作確認
・Vagrant<br>
Installed Version: 2.2.10
・VirtualBox<br>
6.1.8r137981

## 起動
```
$ cd Build_Leaning_Network<br>
$ vagrant up
```
## ネットワーク設定の保存・復元機能の設定
```
管理用サーバに接続
$ vagrant ssh mg<br>

$ cd awx/installer
$ vi inventory
```
以下をコメントアウト，ユーザとパスワードを任意のものに変更<br>

```
admin_user=admin
admin_password=password
(略)
project_data_dir=/var/lib/awx/projects
```


