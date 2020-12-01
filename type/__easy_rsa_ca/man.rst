cdist-type__easy_rsa_ca(7)
==========================

NAME
----
cdist-type__easy_rsa_ca - Build an Easy-RSA Certificate Authority (CA).


DESCRIPTION
-----------
This type sets up an Easy-RSA CA in the directory specified with the ``--dir``
parameter.

As a prerequisite the :strong:`cdist-type__easy_rsa_pki`\ (7) must have
created a PKI structure in said directory beforehand.

To have multiple CAs it is required to create one PKI directory structure (using
:strong:`cdist-type__easy_rsa_pki`\ (7)) for each.

The optional parameters have no effect on an already existing CA.

The behaviour of multiple objects with the same ``--dir`` is **undefined**.

**NB:** This type will neither update an existing CA's subject nor other
parameters if the object's parameters are changed at a later point in time.


REQUIRED PARAMETERS
-------------------
dir
    Full path of the corresponding Easy-RSA PKI structure (as created by
    :strong:`cdist-type__easy_rsa_pki`\ (7)).


OPTIONAL PARAMETERS
-------------------
common-name
    The Common Name (CN) for this CA.
    Defaults to ``__object_id``.
digest
    The digest to use for the CA.
    Valid choices include: md5, sha1, sha256, sha224, sha384, sha512
key-size
    value for EASYRSA_KEY_SIZE (keysize in bits to generate)


The following optional parameters correspond to the default values in
organisational fields (only used if the PKI's DN mode is set to ``org``):

country
    value for EASYRSA_REQ_COUNTRY (DN country)
province
    value for EASYRSA_REQ_PROVINCE (DN state/province)
city
    value for EASYRSA_REQ_CITY (DN city/locality)
org
    value for EASYRSA_REQ_ORG (DN organization)
org-unit
    value for EASYRSA_REQ_OU (DN organizational unit)
email
    value for EASYRSA_REQ_EMAIL (DN email)


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

    # Set up a CA with common name "Example_CA"
    require=__easy_rsa_pki/etc/easy-rsa \
    __easy_rsa_ca Example_CA --dir /etc/easy-rsa

    # Set up a CY with a space in its common name
    require=__easy_rsa_pki/etc/easy-rsa \
    __easy_rsa_ca Example_CA --dir /etc/easy-rsa --common-name 'My Example CA'


SEE ALSO
--------
:strong:`cdist-type__easy_rsa_pki`\ (7),
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
