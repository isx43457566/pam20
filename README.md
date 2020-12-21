PAM
@edt ASIX M06 2020-2021

Podeu trobar les imatge a hub.docker.com/isx43457566/pam20

Imatges:

   · isx43457566/pam20:base host pam per practicar PAM amb chfn i system-auth. Es tracten els types auth i session amb chfn practicant el significat de optional, sufficient, required i requisite i el mòdul pam_unix.so. El type password amb pwquality. El type account amb pam_time.so. El type sessions amb pam_mkhomedir.so i pam_mount.so. Es practica pam_mount.so amb un muntatge tmpfs i un de nfs4.

    Atenció, cal usar en el container --privileged per poder fer els muntatges nfs.

 	   $ docker run --rm --name pam.edt.org --hostname pam.edt.org --net hisx2 --privileged -it isx43457566/pam20:base

   · isx43457566/pam20:ldap host pam per practicar PAM amb autenticació local unix (pam_unix.so) i autenticació LDAP (amb pam_ldap.so). Utilitza el paquet nss-pam-ldapd. Cal configurar: ldap.conf, nslcd, nscd i nssitch. L'autentitació es configura al system-auth.

    Atenció, cal usar en el container --privileged per poder fer els muntatges nfs.

  	  $ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisix -p 389:389 -d isx43457566/ldap20:latest
  	  $ docker run --rm --name pam.edt.org --hostname pam.edt.org --net 2hisix --privileged -it isx43457566/pam20:ldap

   · isx43457566/pam20:python host pam basat en pam20:base per practicar crear una aplicació PAM Aware i per crear el nostre propi mòdul de PAM.

    Amb l'aplicació PAM Aware pamware.py es fa un programa que mostra els números del 1 al 10 però sempre i quant l'usuari que l'executa sigui un usuari autenticat (pam_unix.so).

    Es dissenya un mòdul propi de PAM anomenat pam_mates.py que autentica els usuaris segons si saben respondre o no a una pregunta de mates. Els usuaris que en saben queden autenticats, si no diuen la resposta correcta es denega l'autenticació. Per poder usar un modul pam escrit en python cal descarregar, compilar i incorporar com a llibreia el mòdul pam_pyhton.so.

   	 $ docker run --rm --name pam.edt.org --hostname pam.edt.org --net 2hisix -it isx43457566/pam20:python

  	  # Test pam_pyhton.so pam_mates.py
   	 su - unix01
   	 chfn

   	 # Test pamwarare.py
   	 python3 /opt/docker/pamaware.py

    · isx43457566/pam20:auth host pam que configura l'autenticació unix i ldap usant authconfig. Es crea automàticament el directori home dels usuaris de ldap (filtrat per uid) i es munta un recurs tmpfs de 100MB.

    Atenció: fabricat usant Fedora-27 en lloc de Fedora-32 per usar authconfig en lloc de authselect

    Atenció: cal usar en el container --privileged per poder fer els muntatges.

	$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisix -p 389:389 -d isx43457566/ldap20:latest
	$ docker run --rm --name pam.edt.org --hostname pam.edt.org --net 2hisix --privileged -it isx43457566/pam20:auth

