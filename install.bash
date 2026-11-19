export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $SCRIPT_DIR

mkdir ~/.local/share/Steganography_Toy_Model
mkdir ~/.local/share/Steganography_Toy_Model/vllm
mkdir ~/.local/share/Steganography_Toy_Model/vllm/logs/
mkdir ~/.local/share/Steganography_Toy_Model/hf-cache/
mkdir ~/.local/share/Steganography_Toy_Model/stop

apt-get update
apt-get install -y python3
apt-get install -y nvidia-container-toolkit
apt-get install -y docker.io

curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
uv venv --seed --python 3.13
source .venv/bin/activate

pip install mini-swe-agent
pip install vllm
pip install litellm
vllm download-kernels