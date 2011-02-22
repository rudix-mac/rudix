import unittest
from rudix import *

class RudixTest(unittest.TestCase):
    def test_version_compare(self):
        self.assertEqual(version_compare('1.0', '2.0'), -1)
        self.assertEqual(version_compare('1.0', '1.0.1'), -1)
        self.assertEqual(version_compare('1.0.2', '1.0.10'), -1)
        self.assertEqual(version_compare('1.0.1-2', '1.0.1-10'), -1)
        self.assertEqual(version_compare('1.11-1', '1.11.1-0'), -1)
        self.assertEqual(version_compare('2.1.0b1-0', '2.1.2-0'), -1)
        self.assertEqual(version_compare('2.2.1-10', '3.0-0'), -1)
        self.assertEqual(version_compare('1.0-1', '1.0.1'), -1)
        self.assertEqual(version_compare('1.0-3', '1.0.2'), -1)
        self.assertEqual(version_compare('1.0', '1.0-1'), -1)
        self.assertEqual(version_compare('1.0.2', '1.0.10'), -1)
        self.assertEqual(version_compare('1.0.1-2', '1.0.1-10'), -1)
        self.assertEqual(version_compare('R13B', 'R14B'), -1)
        # -0 is the same as an empty release number)
        self.assertEqual(version_compare('1.0.1', '1.0.1-0'), 0)

    def test_sort_version(self):
        l = ['1.0', '1.0-2', '1.0.1', '1.2', '1.7', '1.7.1']
        l2 = sorted(l, cmp=version_compare)
        for i in zip(l,l2):
            self.assertEqual(i[0], i[1])

    def test_communicate(self):
        self.assertEqual(communicate(['echo', 'rudix']), ['rudix'])

    def test_normalization(self):
        self.assertEqual( normalize('rudix'), 'org.rudix.pkg.rudix' )
        self.assertEqual( normalize('org.rudix.pkg.rudix'),
                          'org.rudix.pkg.rudix' )
        self.assertEqual( denormalize('org.rudix.pkg.rudix'), 'rudix' )
        self.assertEqual( denormalize('rudix'), 'rudix' )

    def test_process(self):
        self.assertEqual( process(['-h']), 0 )
        self.assertEqual( process(['-v']), 0 )
        self.assertEqual( process(['-a']), 2 ) # option -a not used
        self.assertEqual( process(['help']), 0 )
        self.assertEqual( process(['version']), 0 )
        self.assertEqual( process(['foo']), 2 ) # command  foo doesn't exists

if __name__ == '__main__':
    unittest.main()
