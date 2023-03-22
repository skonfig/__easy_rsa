cdist-type__easy_rsa_pki(7)
===========================

NAME
----
cdist-type__easy_rsa_pki - Install an easy-rsa PKI


DESCRIPTION
-----------
This cdist type can be used to set up an Easy-RSA PKI structure in the
``__object_id`` directory on the target and manage its configuration.

**NB:** That the directory in ``__object_id`` is required to be empty.
The ``EASYRSA_PKI`` will be located at ``${__object_id}/pki``.

The optional parameters will have an effect on the ``vars`` file.

This cdist type does not build an Easy-RSA CA (for this,
see :strong:`cdist-type__easy_rsa_ca`\ (7)).

One Easy-RSA PKI can hold at most one CA, so it is necessary to
use this type once for each usage of ``__easy_rsa_ca``.

REQUIRED PARAMETERS
-------------------
None.


OPTIONAL PARAMETERS
-------------------
ca-expire-days
    The default CA validity time in days.

cert-expire-days
    The default expiration time in days for issued certs.

cert-renewal-allowed-days
    The default days before expiration an issued certificate is allowed to
    be renewed.

crl-publish-days
    The default days until the next publish date of the CRL.

default-ec-curve
    The default named EC curve to use (if ``--use-algo ec``).

default-keysize
    The size in bits for your keypairs.
    Only used if ``--use-algo rsa``.

digest
    Cryptographic digest to use.
    Do not change this default unless you understand the security implications.

    Valid choices include: md5, sha1, sha256, sha224, sha384, sha512

dn-mode
    The X509 DN (Distinguished Name) mode.
    Choices are:

    cn_only
        use just a CN value.
    org
        use the "traditional" Country/Province/City/Org/OU/email/CN format.

use-algo
    The crypto mode to use.
    Possible values:

    rsa
        RSA mode.
    ec
        Elliptic Curve Cryptography mode.

    Default is: ``rsa``.


The following optional parameters correspond to the default values in
organisational fields (only used if ``--dn-mode org``):

default-country
    Country.

default-province
    Province.

default-city
    City.

default-org
    Organisation.

default-email
    Email.

default-ou
    Organisational unit.


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

    # Ensure existence of an Easy-RSA PKI structure in directory /etc/easy-rsa
    __easy_rsa_pki /etc/easy-rsa

    # Ensure existence of a PKI in directory /etc/easy-rsa with defaults
    __easy_rsa_pki /etc/easy-rsa \
        --use-algo rsa \
        --default-keysize 4096 \
        --dn-mode org \
        --default-digest sha512 \
        --default-country CH \
        --default-province SG \
        --default-city Werdenberg \
        --default-org SSRQ \
        --default-email test@example.com \
        --default-ou "Unit 1"`


SEE ALSO
--------
:strong:`cdist-type__easy_rsa_ca`\ (7),
:strong:`cdist-type__easy_rsa_cert`\ (7)


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
