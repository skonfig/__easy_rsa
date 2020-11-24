cdist-type__easy_rsa_pki(7)
===========================

NAME
----
cdist-type__easy_rsa_pki - Install an easy-rsa PKI


DESCRIPTION
-----------
This cdist type can be used to set up an easy_rsa PKI and manage its
configurations.

The optional parameters will have an effect on the `vars` file.

This cdist type does not build an easy-rsa CA (for this,
see `__easy_rsa_ca`\ (7)).

One easy-rsa PKI can hold at most one easy-rsa CA, so it is necessary to
use this type once for each `__easy_rsa_ca` usage.

REQUIRED PARAMETERS
-------------------
None.


OPTIONAL PARAMETERS
-------------------

default-keysize
    The size in bits for your keypairs. Only used when the crypto algorithm
    is rsa.

use-algo
    The crypto mode to use. Possible values are "rsa" and "ec"
    (all lowercase), for RSA mode and Elliptic Curve Cryptography.
    The default mode is "rsa".

default-ec-curve
    The default named EC curve to use.

dn-mode
    The X509 DN mode. Choices are
      cn_only  - use just a CN value
      org      - use the "traditional" Country/Province/City/Org/OU/email/CN format

digest
    Cryptographic digest to use.
    Do not change this default unless you understand the security implications.
    Valid choices include: md5, sha1, sha256, sha224, sha384, sha512

ca-expire-days
    The default CA expiration time in days.

cert-expire-days
    The default expiration time in days for issued certs.

crl-publish-days
    The default days until the next publish date of the CRL.

cert-renewal-allowed-days
    The default days before expiration an issued certificate is allowed to
    be renewed.

The following optional parameters correspond to the default values in
organisational fields (used only in 'org' mode and ignored in 'cn_only' mode).

default-req-country
    Country.

default-req-province
    Province.

default-req-city
    City.

default-req-org
    Organisation.

default-req-email
    Email.

default-req-ou
    Organisational unit


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

    # Ensure existence of pki in directroy `/some/folder`
    `__easy_rsa_pki /some/folder`

    # Ensure existence of pki in directory `/some/folder` and set some params.
    `__easy_rsa_pki ${pki_dir} --use-algo rsa --default-keysize 119 --dn-mode cn_only --digest sha512 --default-req-country CH --default-req-province SG --default-req-city Werdenberg --default-req-org SSRQ --default-req-email test@example.com --default-req-ou "Unit 1"`



SEE ALSO
--------
:strong:`__easy_rsa_ca`\ (7), `__easy_rsa_cert`\ (7)


AUTHORS
-------
Marko Seric <marko.seric@ssrq-sds-fds.ch>


COPYING
-------
Copyright \(C) 2020 Marko Seric. You can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
