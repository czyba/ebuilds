EAPI=6

inherit versionator cmake-utils git-r3
TMP_PV="$(replace_all_version_separators '_' )"

DESCRIPTION="azure-c-shared-utility is a C library providing common functionality for basic tasks (like string, list manipulation, IO, etc.)."
HOMEPAGE="https://github.com/Azure/${PN}"

EGIT_REPO_URI="https://github.com/Azure/azure-c-shared-utility.git"
EGIT_BRANCH="release_${TMP_PV}"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-misc/curl
	dev-libs/openssl
	sys-apps/util-linux
"
RDEPEND="${DEPEND}"

src_configure() {
  local mycmakeargs=(
    -DBUILD_TESTING=OFF
    -Duse_installed_dependencies=ON
    -Dbuild_as_dynamic=ON
  )
  cmake-utils_src_configure
}
