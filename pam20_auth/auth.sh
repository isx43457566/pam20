#! bin/bash
authconfig --enableshadow --enablelocalauthorize --enableldap --enableldapauth --ldapserver='ldap.edt.org' --ldapbase='dc=edt,dc=org' --enablemkhomedir --updateall
