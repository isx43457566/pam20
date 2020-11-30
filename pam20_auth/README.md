PAM

@edt ASIX M06 2020-2021

Host PAM amb utenticació local d'usuaris unix i de usuaris LDAP.

Imatge a dockerhub: isx43457566/pam20:auth

$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d isx43457566/ldap20:group
$ docker run --rm --name pam.edt.org --hostname pam.edt.org --net 2hisix --privileged -it isx43457566/pam20:ldap

