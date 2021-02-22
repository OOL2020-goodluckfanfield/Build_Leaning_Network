# Build_Leaning_Network
OOL2020-goodluckfanfield

## 動作確認
```
・Vagrant
Installed Version: 2.2.10
・VirtualBox
6.1.8r137981
```
## 起動
```
$ cd Build_Leaning_Network
$ vagrant up
```
## ネットワーク設定の保存・復元機能の設定
### AWXのインストール
```
管理用サーバに接続
$ vagrant ssh mg
認証情報を編集
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
AWXをインストール
```
$ ansible-playbook -i inventory install.yml
```



