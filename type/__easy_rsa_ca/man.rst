cdist-type__easy_rsa_ca(7)
==========================

NAME
----
cdist-type__easy_rsa_ca - Build an easy-rsa CA for an easy-rsa PKI.


DESCRIPTION
-----------
This type sets up an easy rsa CA in the directory `<pki-dir>`.
As a prerequisite the cdist-type__easy_rsa_pki must be present in `<pki-dir>`.
(I.e. there is a PKI in `<pki-dir>/pki`, see also `__easy_rsa_pki`\ (7).

Having multiple CAs is possible. However, as one easy-rsa PKI can have at most
one CA, it is necessary to generate one PKI for each desired CA. Specifying a
different CA for the same PKI will not have an effect.


REQUIRED PARAMETERS
-------------------
pki-dir
    Full path of the directory inside which the easy-rsa PKI resides.

common-name
    The Common Name (eg: your user, host, or server name).


OPTIONAL PARAMETERS
-------------------
digest
    The digest to use for cert/req signing.
    Valid choices include: md5, sha1, sha256, sha224, sha384, sha512

BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

    # Set up an easy-rsa CA with common name `example.com` where there is
    # an easy-rsa PKI inside `<path>`.
    `__easy_rsa_ca example.com --pki-dir <path>`

    # The analogue of above, with --pki-dir as `/etc/easyrsa`, using cdists's
    # dependency with `require`.
    `require="__easy_rsa_pki//etc/easyrsa" __easy_rsa_ca example.com --pki-dir /etc/easyrsa`

    # Setting up two CAs, each in its own PKI (for `example-foo.com` and `example-bar.com`)
    `require="__easy_rsa_pki//etc/easyrsa-foo" __easy_rsa_ca example-foo.com --pki-dir /etc/easyrsa-foo`
    `require="__easy_rsa_pki//etc/easyrsa-bar" __easy_rsa_ca example-bar.com --pki-dir /etc/easyrsa-bar`


SEE ALSO
--------
:strong:`__easy_rsa_pki`\ (7), `__easy_rsa_cert`\ (7)


AUTHORS
-------
Marko Seric <marko.seric@ssrq-sds-fds.ch>


COPYING
-------
Copyright \(C) 2020 Marko Seric. You can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
