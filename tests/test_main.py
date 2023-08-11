import main


def test_add():
    assert main.add(3, 4) == 7
    assert main.add(0, 0) == 0
    assert main.add(-1, 1) == 0
    assert main.add(-1, -1) == -2


def test_subtract():
    assert main.subtract(10, 5) == 5
    assert main.subtract(0, 0) == 0
    assert main.subtract(1, 3) == -2
    assert main.subtract(-5, -3) == -2
