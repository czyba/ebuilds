EAPI=6

inherit versionator cmake-utils git-r3
TMP_PV="$(replace_all_version_separators '_' )"

DESCRIPTION="uAMQP is a general purpose C library for AMQP 1.0."
HOMEPAGE="https://github.com/Azure/${PN}"

EGIT_REPO_URI="https://github.com/Azure/${PN}.git"
EGIT_COMMIT="8ce91350d2a4a962950ad4edc8d8d14df2de6ca8"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-misc/curl
	dev-libs/openssl
	sys-apps/util-linux
	=net-libs/azure-c-shared-utility-${PV}
"
RDEPEND="${DEPEND}"

src_configure() {
  local mycmakeargs=(
    -DBUILD_TESTING=OFF
    -Duse_installed_dependencies=ON
  )
  cmake-utils_src_configure
}
