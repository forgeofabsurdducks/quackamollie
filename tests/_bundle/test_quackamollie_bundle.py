# -*- coding: utf-8 -*-
__author__ = "QuacktorAI"
__copyright__ = "Copyright 2024, Forge of Absurd Ducks"
__credits__ = ["QuacktorAI"]

from quackamollie._bundle import quackamollie_version


def test_quackamollie_bundle_version_equals_package_version():
    """ Assert quackamollie._bundle version matches the package version automatically changed by bump-my-version """
    assert quackamollie_version == "0.1b0", 'Version number should match library version.'
