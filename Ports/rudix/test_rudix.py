import unittest
from rudix import version_compare

class RudixTest(unittest.TestCase):
    def test_version_compare(self):
        self.assertEqual( version_compare('1.0', '2.0'), -1)
        self.assertEqual( version_compare('1.0', '1.0.1'), -1)
        self.assertEqual( version_compare('1.0', '1.0-1'), -1)
        self.assertEqual( version_compare('1.0.2', '1.0.10'), -1)
        self.assertEqual( version_compare('1.0.1-2', '1.0.1-10'), -1)
        # -0 is the same as an empty release number)
        self.assertEqual( version_compare('1.0.1', '1.0.1-0'), 0)

if __name__ == '__main__':
    unittest.main()
