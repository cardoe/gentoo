# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
inherit distutils-r1

DESCRIPTION="Python client for the Prometheus monitoring system"
HOMEPAGE="https://pypi.python.org/pypi/prometheus_client"
SRC_URI="https://github.com/prometheus/client_python/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

S=${WORKDIR}/client_python-${PV}

RDEPEND="dev-python/twisted[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( ${RDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}] )"

python_test() {
	pytest || die
}
