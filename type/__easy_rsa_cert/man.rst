cdist-type__easy_rsa_cert(7)
============================

NAME
----
cdist-type__easy_rsa_cert - Manage a server or client key pair.


DESCRIPTION
-----------
This type manages private keys and certificates using Easy-RSA.
The certificate type (server or client) can be defined using ``--cert-type``.

As a prerequisite the :strong:`cdist-type__easy_rsa_pki`\ (7) and
:strong:`cdist-type__easy_rsa_ca`\ (7) must have created a PKI structure and
Certificate Authority (CA) in said directory beforehand.

**NB:** This type will neither update an existing certificate's subject nor
other parameters if the object's parameters are changed at a later point in
time.


REQUIRED PARAMETERS
-------------------
cert-type
    The type of the certificate, either ``server`` or ``client``.
dir
    Full path of the corresponding Easy-RSA PKI structure (as created by
    :strong:`cdist-type__easy_rsa_pki`\ (7)).


OPTIONAL PARAMETERS
-------------------
cert-expiration-days
    Days until expiration of the certificate.
common-name
    The Common Name (CN) for this certficiate.
    Defaults to ``__object_id``.
digest
    The digest to use for this certificate.
    Valid choices include: md5, sha1, sha256, sha224, sha384, sha512
key-size
    The key size to use for the request.
state
    Possible values:

    signed
        the certificate has been created and signed by the CA.
    valid
        like signed, but will renew the certificate if it expired.
        *NB:* Easy-RSA will also generate a new private key when renewing the
        certificate.
    revoked
        either the certificate is no defined, or will be revoked.

    Default is: ``signed``.
use-algo
    The algorithm to use.
    Possible values:

    rsa
        RSA mode.
    ec
        Elliptic Curve Cryptography mode.

    Default is: ``rsa``.


The following optional parameters correspond to the default values in
organisational fields (only used if the PKI's DN mode is set to ``org``):

country
    Country.
province
    Province.
city
    City.
org
    Organisation.
org-unit
    Organisational unit.
email
    Email.


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh
    # server certificate
    __easy_rsa_cert openvpn-server \
        --dir /etc/easy-rsa \
        --cert-type server

    # client certificate
    __easy_rsa_cert janedoe \
        --dir /etc/easy-rsa \
        --cert-type client


SEE ALSO
--------
:strong:`cdist-type__easy_rsa_pki`\ (7),
:strong:`cdist-type__easy_rsa_ca`\ (7)


AUTHORS
-------
| Marko Seric <marko.seric--@--ssrq-sds-fds.ch>
| Beni Ruef <bernhard.ruef--@--ssrq-sds-fds.ch>
| Dennis Camera <dennis.camera--@--ssrq-sds-fds.ch>


COPYING
-------
Copyright \(C) 2020 the AUTHORS. You can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
