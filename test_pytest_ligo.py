from pytest_tezos.TestTypes import Nat


def test_ligo(tezos, ligo):
    assert ligo.bin
    assert ligo.compile('contract.mligo')
    assert ligo.compile(Nat(0))
    originate = ligo.compile('contract.mligo').originate(
        tezos.clients[0],
        Nat(0),
    )
    assert originate.inject


def test_compile_originate_wait(tezos, ligo):
    assert tezos.wait(ligo.compile('contract.mligo').originate(
            tezos.clients[0], Nat(0)).inject())


def test_ligo_tezos_integration(ligo, tezos):
    tx = ligo.compile('contract.mligo').originate(
        tezos.clients[0],
        Nat(0),
    )

    origination = tx.inject()
    assert origination['hash']

    contract_address = tezos.contract_address(origination)
    assert contract_address

    ci = tezos.clients[0].contract(contract_address)
    assert ci
    assert ci.storage() == 0
    return

    opg = tezos.wait(ci.add(3))
    time.sleep(3)

    ci = tezos.clients[0].contract(contract_address)
    assert ci.storage() == 3
