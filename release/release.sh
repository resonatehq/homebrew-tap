set -euo pipefail
set -x

version=$(curl --silent --location --fail https://api.github.com/repos/resonatehq/resonate/releases/latest | grep '^  "name"' | awk '{print $2}' | tr -d '"v,')
echo "bumping to latest version found: ${version}"

# Mac
darwin_arm64=$(curl --silent --location --fail "https://github.com/resonatehq/resonate/releases/download/v${version}/resonate_darwin_aarch64.tar.gz.sha256" | awk '{print $1}')
echo "retrieving sha256 for darwin_arm64 release: ${darwin_arm64}"

darwin_x86=$(curl --silent --location --fail "https://github.com/resonatehq/resonate/releases/download/v${version}/resonate_darwin_x86_64.tar.gz.sha256"| awk '{print $1}')
echo "retrieving sha256 for darwin_x86 release: ${darwin_x86}"

# Linux
linux_arm64=$(curl --silent --location --fail "https://github.com/resonatehq/resonate/releases/download/v${version}/resonate_linux_aarch64.tar.gz.sha256" | awk '{print $1}')
echo "retrieving sha256 for linux_arm64 release: ${linux_arm64}"

linux_x86=$(curl --silent --location --fail "https://github.com/resonatehq/resonate/releases/download/v${version}/resonate_linux_x86_64.tar.gz.sha256"| awk '{print $1}')
echo "retrieving sha256 for linux_x86 release: ${linux_x86}"

export version darwin_arm64 darwin_x86 linux_arm64 linux_x86

# Render the formula
echo "rendering formula"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

CLASSNAME="Resonate"
BINARY="resonate"
DESC="A dead simple programming model for the cloud"

sed -e "s/\${CLASSNAME}/$CLASSNAME/g" \
   -e "s/\${BINARY}/$BINARY/g" \
   -e "s/\${DESC}/$DESC/g" \
   -e "s/\${version}/$version/g" \
   -e "s/\${darwin_arm64}/$darwin_arm64/g" \
   -e "s/\${darwin_x86}/$darwin_x86/g" \
   -e "s/\${linux_arm64}/$linux_arm64/g" \
   -e "s/\${linux_x86}/$linux_x86/g" \
   "${SCRIPT_DIR}/resonate.rb.tmpl" > "${SCRIPT_DIR}/../Formula/resonate.rb"

# Commit the changes
git -C "${SCRIPT_DIR}/.." reset
git -C "${SCRIPT_DIR}/.." add "Formula/resonate.rb"

if git diff --cached --exit-code; then
  echo "Nothing to commit"
else
  git -C "${SCRIPT_DIR}/.." commit -m "Bump version to ${version}"
fi

echo "formula updated"
