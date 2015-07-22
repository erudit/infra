#!/bin/bash
#------------------------------------------------
# Copyright (c) 2014 Alexandre Guédon - Erudit.org
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

#------------------------------------------------
# DEPENDENCY: openssl.cnf

#------------------------------------------------
# INFORMATION:
# Script pour générer le certificat WildCard *.erudit.org pour RapidSSL
# Au final la situation des clés devrait ressembler à ceci:
# - .key : la clé privé
# - .csr : le certificate signing request à envoyer à RapidSSL
# - .crt : le résultat obtenu de RapidSSL
# - .pem(s) : les certificats à récupérer:
#     - GeoTrust (racine, SHA-1 en 2014)
#       RapidSSL (intermédiaire, SHA-256)
#       https://knowledge.rapidssl.com/support/ssl-certificate-support/index?page=content&actp=CROSSLINK&id=SO26457
# 
# Le script sert surtout de guide puisque l'achat se fait en 2 étapes:
# Tel quel, il génère la clé privée et le CSR et indique quoi faire avec le CRT.

#------------------------------------------------
# Variables à ajuster
export DATE=$(date +"%Y%m%d")
export SITENAME="erudit_org"
export KEYNAME="${SITENAME}-${DATE}"
export KEYLEN="2048"                                # 4096 à considérer, mais vérifier load CPU / SPDY / ...(CA à 2048)
export SHA="sha256"                                 # SHA-512 à considérer, vérifier la compatibilité       (CA à SHA-256).
export REQSUB="/C=CA/ST=Quebec/L=Montreal/O=Universite de Montreal/OU=Erudit/CN=*.erudit.org/emailAddress=info@erudit.org" # Retiré par CA
export CONFPATH="./openssl.cnf"                     # Config modifiée: Active les SAN via X509v3 extension, requis pour WildCards
export SAN="DNS:erudit.org"                         # Voir "ERUDIT:" dans openssl.cnf au besoin
#export SAN="DNS:erudit.org, DNS:www.erudit.org"    # Exemple avec plus d'un SAN (pour d'autres contextes)

#--- AVANT L'ACHAT DU .CRT ----------------------

# Quick check : directory already exist?
if ! mkdir SSL_${DATE} ; then
    echo "Directory SSL_${DATE} already exist, not overwriting, please rename or change your working directory."
    exit 1 # Don't continue, nor overwrite anything...
fi

# Move into newly created directory
cd SSL_${DATE}

#------------------------------------------------

echo "Generating private key and certificate signing request (.csr)."
echo "CSR needs to be sent to the Certificate Authority (CA) to get a certificate (.crt/.pem)"
echo "openssl req -new -newkey rsa:${KEYLEN} -nodes -out ${KEYNAME}.csr -keyout ${KEYNAME}.key -${SHA} -subj "${REQSUB}" -config ${CONFPATH}"

openssl req -new -newkey rsa:${KEYLEN} -nodes -out ${KEYNAME}.csr -keyout ${KEYNAME}.key -${SHA} -subj "${REQSUB}" -config ${CONFPATH}

echo "----------------------------------------"
echo "Verify that the CSR has a proper CN for the wildcard of the site (*.erudit.org) & a SAN for erudit.org"
openssl req -in ${SITENAME}.csr -noout -text

#--- APRÈS AVOIR REÇU LE .CRT -------------------

### Attendre le certificate (.crt) par courriel une fois la commande passée
### Copier/coller dans erudit_org-${DATE}.crt
# cat > SSL_${DATE}/erudit_org-${DATE}.crt

### Vérifier le certificat
# openssl x509 -in erudit_org.crt -text -noout

### Then move directory, configure Apache, etc...
