cdist-type__easy_rsa_cert(7)
============================

NAME
----
cdist-type__easy_rsa_cert - Uses easy-rsa to generate a keypair and
sign it locally for a client or a server.


DESCRIPTION
-----------
This type generates either a server certificate or a client certificate,
depending on `cert-type`. 


REQUIRED PARAMETERS
-------------------
cert-type
    The type of the certificate, either 'server' or 'client'.

pki-dir
    Full path of the directory inside which the easy-rsa PKI resides.

OPTIONAL PARAMETERS
-------------------
keysize
    The keysize to use for the request.

use-algo
    The algorithm to use. Allowed values are "rsa" and "ec".

cert-expiration-days
    Days until expiration of the certificate.


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh
    # Generating a server cert request, where there is already
    # a PKI of type `__easy_rsa_pki /etc/easyrsa`
    `__easy_rsa_cert example.com --pki-dir /etc/easyrsa --cert-type server`




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
