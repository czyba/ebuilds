EAPI=6

inherit versionator
MY_PN="${PN}"
MY_PV="${PV}"
MY_P="${PN}-${MY_PV}"

TMP_PV="$(replace_all_version_separators '_' )"
inherit cmake-utils git-r3

DESCRIPTION="azure-c-shared-utility is a C library providing common functionality for basic tasks (like string, list manipulation, IO, etc.)."
HOMEPAGE="https://github.com/Azure/${PN}"

EGIT_REPO_URI="https://github.com/Azure/azure-c-shared-utility.git"
EGIT_BRANCH="release_${TMP_PV}"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_configure() {
  local mycmakeargs=(
    -DBUILD_TESTING=OFF
    -Duse_installed_dependencies=ON
  )
  cmake-utils_src_configure
}

