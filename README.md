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
以下をコメントアウト，ユーザとパスワードを任意のものに変更

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

### Projectの登録
管理用サーバでの作業
```
Playbookファイルの移動
$ cd ~
$ sudo mv playbooks /var/lib/awx/projects/
```
Web UIでの作業
```
1. ブラウザで"http://localhost:4567/"を入力し，Web UIに移動（ユーザ名とパスワードはインストール前に決めたもの）．
2. Projectsタブを選択，”Add”を選択すると，Create ｎew projectページが表示される．
3. ”Name”は任意，”Source Control Credential Type”は”Manual”，”Playbook Directory”は移動させた”playbooks”を選択．
4. ”Save”を選択．
```
### Inventoryの登録
Web UIでの作業
```
1. Inventoriesタブを選択， ”Add Inventory”を選択すると，Create new inventoryページが表示される．
2. ”Name”は任意．
3. ”Save”を選択．
4. Group detailsから”Groups”を選択，”Add”を選択すると，Create new groupページが表示される．
5. ”Name”はansibleを実行したいOS名（今回は”vyos”），”Variables”に
---
ansible_network_os: vyos
ansible_connection: network_cli
と入力．

6. ”Hosts”からAddを選択，Create new hostページが表示される．
7. ”Name”は任意，”Variables”に
---
ansible_host: 10.10.0.20
と入力．
8.6，7の手順で”10.10.0.30”，”10.10.0.40”も登録する．
9.”Details”から，”Groups”タブを選択，作成したGroupを選択し，”Hosts”タブへ移動．
10.”Add existing host”を選択し，追加したhostすべてを選択する．
11.”Save”を選択．
```
### Credentialの登録
Web UIでの作業
```
1. Credentialsタブを選択， ”Add”を選択すると，Create New Credentialページが表示される．
2. ”Name”は任意，Credential Typeは”Machine”を選択．
3. Type Detailsが表示されるので，ユーザ名は”vagrant”，パスワードは”vagrant”を入力．
4. ”Save”を選択．
```

### Templatesの作成
Web UIでの作業
```
1. Templatesタブを選択，”Add job template”を選択すると，Create New Job Templateページが表示される．
2. ”Name”は任意，”Job Type”は”Run”，”Inventory”は作成したもの，”Project”も作成したもの，”Playbook”は”backup.yml”，”Credentials”は作成したものを選択．
3. ”Save”を選択．
4. 同様の手順で”Playbook”を”restore.yml”にしたものを作成．
```
### Templeteの実行
```
Templatesタブを選択，作成したTemplateを選択し，”Launch Template”で実行．

・バックアップについて
管理用サーバで
$ docker exec -i -t awx_task bash
を実行し，コンテナ内へ
bash-4.4# ls /tmp/backup/
でバックアップファイルが作成されていることを確認
```
