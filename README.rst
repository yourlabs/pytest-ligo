pytest-ligo
~~~~~~~~~~~

Py.test plugin which adds a ligo fixture to encapsulate boilerplate business
logic.

Install with pip, ie::

    pip install -e git+http://gitlab.com/jpic/pytest-ligo.git#egg=pytest-tezos
    pip install -e git+http://gitlab.com/jpic/pytest-ligo.git#egg=pytest-ligo

You also need ligo, which you can install in ~/.local/bin with::

    curl https://gitlab.com/jpic/pytest-ligo/raw/master/install.sh | bash -eux -

Test is example usage in test_pytest_ligo.py
