from pytest_tezos.TestTypes import Nat


def test_ligo(tezos, ligo):
    assert ligo.bin
    assert ligo.compile('contract.mligo')
    assert ligo.compile(Nat(0))
    originate = ligo.compile('contract.mligo').originate(
        tezos.client,
        Nat(0),
    )
    assert originate.inject


def test_compile_originate_wait(tezos, ligo):
    assert tezos.wait(ligo.compile('contract.mligo').originate(
            tezos.client, Nat(0)).inject())


def test_ligo_tezos_integration(ligo, tezos):
    tx = ligo.compile('contract.mligo').originate(
        tezos.client,
        Nat(0),
    )

    origination = tx.inject()
    assert origination['hash']

    contract_address = tezos.contract_address(origination)
    assert contract_address

    ci = tezos.client.contract(contract_address)
    assert ci
    assert ci.storage() == 0

    opg = tezos.wait(ci.add(3))

    ci = tezos.client.contract(contract_address)
    assert ci.storage() == 3
