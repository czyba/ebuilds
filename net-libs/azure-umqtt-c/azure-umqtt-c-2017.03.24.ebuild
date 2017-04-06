EAPI=6

inherit versionator cmake-utils git-r3
TMP_PV="$(replace_all_version_separators '_' )"

DESCRIPTION="azure-umqtt-c is a general purpose library build for MQTT protocol"
HOMEPAGE="https://github.com/Azure/${PN}"

EGIT_REPO_URI="https://github.com/Azure/${PN}.git"
EGIT_BRANCH="release_${TMP_PV}"

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
