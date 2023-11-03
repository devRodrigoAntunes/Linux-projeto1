#!/bin/bash

echo "Criando Diretorios do sistema..."

mkdir /publico

mkdir /adm

mkdir /ven

mkdir /sec


echo "Criando grupos do sistema..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC


echo "Criando usuarios do sistema..."

useradd carlos -m -c "Carlos ADM" -s /bin/bash -p $(openssl passwd Senha123)
useradd maria -m -c "Maria ADM" -s /bin/bash -p $(openssl passwd Senha123)
useradd joao -m -c "Joao ADM" -s /bin/bash -p $(openssl passwd Senha123)

useradd debora -m -c "Debora VEN" -s /bin/bash -p $(openssl passwd Senha123)
useradd sebastiana -m -c "Sebastiana VEN" -s /bin/bash -p $(openssl passwd Senha123)
useradd roberto -m -c "Roberto VEN" -s /bin/bash -p $(openssl passwd Senha123)

useradd josefina -m -c "Josefina SEC" -s /bin/bash -p $(openssl passwd Senha123)
useradd amanda -m -c "Amanda SEC" -s /bin/bash -p $(openssl passwd Senha123)
useradd rogerio -m -c "Rogerio SEC" -s /bin/bash -p $(openssl passwd Senha123)


echo "Adicionando usuários aos grupos..."
usermod -g GRP_ADM carlos
usermod -g GRP_ADM maria
usermod -g GRP_ADM joao
usermod -g GRP_VEN debora
usermod -g GRP_VEN sebastiana
usermod -g GRP_VEN roberto
usermod -g GRP_SEC josefina
usermod -g GRP_SEC amanda
usermod -g GRP_SEC rogerio


echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizado"
