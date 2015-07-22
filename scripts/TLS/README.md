# Génération des certificats

Ces fichiers et script servent surtout de référence pour le processus
d'achat du certificat chez RapidSSL (en pratique en plusieurs étapes).

Voir la différence entre les différents fichiers:
http://serverfault.com/questions/9708/what-is-a-pem-file-and-how-does-it-differ-from-other-openssl-generated-key-file

Il faut récupérer les certificats racine et intermédiaire. Dans le
cas de RapidSSL, il faut obtenir le certificat:

  - Racine, pour l'instant SHA-1, actuellement (2014) : GeoTrust_Global_CA_20180820.pem 
  - Intermédiaire, SHA-256, actuellement (2014) : RapidSSL_CA_SHA256_G3_20220520.pem

Le script bash et sa configuration de OpenSSL :

  >  TLS.sh
  >  openssl.cnf

Ils permettent de générer la clé privée (.key) et le CSR.  On retrouve
aussi dans le script des explications rapides sur comment vérifier le
CRT une fois reçu du CA...  Pour 2015:

  - https://letsencrypt.org (à surveiller)
  - ... ou API pour automatiser?
