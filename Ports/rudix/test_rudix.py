from rudix import version_compare

def test_version_compare():
    assert version_compare('1.0', '2.0') == -1
    assert version_compare('1.0', '1.0.1') == -1
    assert version_compare('1.0', '1.0-1') == -1
    assert version_compare('1.0.2', '1.0.10') == -1
    assert version_compare('1.0.1-2', '1.0.1-10') == -1
