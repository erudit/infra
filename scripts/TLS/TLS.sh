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
# Script to generate the WildCard certificate for *.erudit.org @ RapidSSL
# In the end, the different key files should look like this :
# - .key : The private key
# - .csr : The certificate signing request to be sent to RapidSSL
# - .crt : The resulting cert from RapidSSL
# - .pem(s) : Varis intermediary cert to be found : 
#     - GeoTrust (racine, SHA-1 en 2014)
#       RapidSSL (intermédiaire, SHA-256)
#       https://knowledge.rapidssl.com/support/ssl-certificate-support/index?page=content&actp=CROSSLINK&id=SO26457
# 
# Le script sert surtout de guide puisque l'achat se fait en 2 étapes:
# Tel quel, il génère la clé privée et le CSR et indique quoi faire avec le CRT.

#------------------------------------------------
# Variables à ajuster
export DATE=$(date +"%Y%m%d")
export SITENAME="erudit.org"
export KEYNAME="${SITENAME}-${DATE}"
# 4096 à considérer, mais vérifier load CPU / SPDY / ...(CA à 2048)
export KEYLEN="2048"
# SHA-512 à considérer, vérifier la compatibilité       (CA à SHA-256).
export SHA="sha256"
 # Retiré par CA
export REQSUB="/C=CA/ST=Quebec/L=Montreal/O=Universite de Montreal/OU=Erudit/CN=*.erudit.org/emailAddress=info@erudit.org"
# Config modifiée: Active les SAN via X509v3 extension, requis pour WildCards
export CONFPATH="../openssl.cnf"
# Voir "ERUDIT:" dans openssl.cnf au besoin
export SAN="DNS:${SITENAME}"
# Exemple avec plus d'un SAN (pour d'autres contextes)
#export SAN="DNS:erudit.org, DNS:www.erudit.org"    

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
echo "Verify that the CSR has a proper CN for the wildcard of the site (*.${SITENAME}) & a SAN for ${SITENAME}"
openssl req -in ${KEYNAME}.csr -noout -text
echo
echo "Manually you can validate the CN and SAN with these commands"
echo "openssl req -in ${KEYNAME}.csr -noout -text | grep \"Subject:.*, CN=\""
echo "openssl req -in ${KEYNAME}.csr -noout -text | grep -A 1 \"X509v3 Subject Alternative Name\" | tail -1"

#--- APRÈS AVOIR REÇU LE .CRT -------------------

### Attendre le certificate (.crt) par courriel une fois la commande passée
### Copier/coller dans erudit.org-${DATE}.crt
# cat > SSL_${DATE}/erudit.org-${DATE}.crt

### Vérifier le certificat
# openssl x509 -in erudit.org.crt -text -noout

### Then move directory, configure Apache, etc...
