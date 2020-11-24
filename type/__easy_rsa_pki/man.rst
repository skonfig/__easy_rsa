cdist-type__easy_rsa_pki(7)
===========================

NAME
----
cdist-type__easy_rsa_pki - TODO


DESCRIPTION
-----------
This space intentionally left blank.


REQUIRED PARAMETERS
-------------------
pki-dir
    The directory inside which the easy-rsa PKI will reside.
    Default is `/etc/easyrsa`.


OPTIONAL PARAMETERS
-------------------
None.


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

    # Ensure existence of pki in directroy <path>
    __easy_rsa_pki --pki-dir <path>



SEE ALSO
--------
:strong:`TODO`\ (7)


AUTHORS
-------
Marko Seric <marko.seric@ssrq-sds-fds.ch>


COPYING
-------
Copyright \(C) 2020 Marko Seric. You can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
