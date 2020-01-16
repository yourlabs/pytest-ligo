pytest-ligo
~~~~~~~~~~~

Py.test plugin which adds a ligo fixture to encapsulate boilerplate business
logic. Refer to ``test_pytest_ligo.py`` for example usage.

Install with pip, ie::

    pip install pytest-ligo

You also need ligo, which you can install in ~/.local/bin with::

    curl https://gitlab.com/jpic/pytest-ligo/raw/master/install.sh | bash -eux -

Note: the above works on arch linux and ubuntu-18.04 without extra
configuration. For debian, export distro=debian-10 or distro=debian-9 prior to
the above command.
