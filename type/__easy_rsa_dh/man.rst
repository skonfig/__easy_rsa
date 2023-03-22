cdist-type__easy_rsa_dh(7)
==========================

NAME
----
cdist-type__easy_rsa_dh - Create DH params


DESCRIPTION
-----------
This type can be used to create or remove Diffie-Hellman parameters using easy-rsa.

Only one DH parameters file can be created per PKI.
Thus, a :strong:`cdist-type__easy_rsa_pki`\ (7) with the same
``__object_id`` must be created, first.


REQUIRED PARAMETERS
-------------------
None.


OPTIONAL PARAMETERS
-------------------
state
   Possible values:

   present
      the DH params file exists.
   absent
      no DH params file exists.

   Default is: ``present``.


BOOLEAN PARAMETERS
------------------
background
   Generation of DH params file can take quite some time.
   This parameter will make the generation run in the background.


EXAMPLES
--------

.. code-block:: sh

   # Create /etc/easy-rsa/pki/dh.pem
   __easy_rsa_dh /etc/easy-rsa


SEE ALSO
--------
:strong:`cdist-type__easy_rsa_pki`\ (7)


AUTHORS
-------
Dennis Camera <dennis.camera--@--ssrq-sds-fds.ch>


COPYING
-------
Copyright \(C) 2021 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
