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
$ sudo vi inventory
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

### Playbookの登録
```
Playbookファイルの移動
$ cd ~
$ sudo mv playbooks /var/lib/awx/projects/

1.ブラウザで"http://localhost:4567/"を入力し，Web UIに移動（ユーザ名とパスワードはインストール前に決めたもの）．
2.Projectsタブを選択，Addを選択すると，Create New Projectページが表示される．
　Nameは任意，Source Control Credential Typeは「Manual」，Playbook Directoryは移動させた「playbooks」を選択．
```
