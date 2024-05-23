set -euo pipefail

version=$(curl --silent --location --fail https://api.github.com/repos/resonatehq/resonate/releases/latest | grep '^  "name"' | awk '{print $3}' | tr -d '"v,')
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

CLASSNAME=Resonate BINARY=resonate DESC="A dead simple programming model for the cloud" envsubst < "${SCRIPT_DIR}/resonate.rb.tmpl" > "${SCRIPT_DIR}/../Formula/resonate.rb"

# Commit the changes
git -C "${SCRIPT_DIR}/.." reset
git -C "${SCRIPT_DIR}/.." add "Formula/resonate.rb"

if git diff --cached --exit-code; then
  echo "Nothing to commit"
else
  git -C "${SCRIPT_DIR}/.." commit -m "Bump version to ${version}"
fi

echo "formula updated"