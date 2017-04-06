EAPI=6

inherit versionator cmake-utils git-r3
TMP_PV="$(replace_all_version_separators '-' )"

DESCRIPTION="Microsoft Azure IoT Hub SDK for C"
HOMEPAGE="https://github.com/Azure/${PN}"

EGIT_REPO_URI="https://github.com/Azure/${PN}.git"
EGIT_COMMIT="${TMP_PV}"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-misc/curl
	dev-libs/openssl
	sys-apps/util-linux
	=net-libs/azure-c-shared-utility-${PV}
	=net-libs/azure-umqtt-c-${PV}
	=net-libs/azure-uamqp-c-${PV}
"
RDEPEND="${DEPEND}"

src_configure() {
  local mycmakeargs=(
    -DBUILD_TESTING=OFF
    -Duse_installed_dependencies=ON
  )
  cmake-utils_src_configure
}
