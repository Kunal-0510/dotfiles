#path for miniconda3
export PATH="/opt/miniconda3/bin:$PATH"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1 #openSSL 3 issue

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/tokyonight_storm.omp.json)"

eval "$(conda shell.zsh hook)"
eval "$(conda shell.zsh hook)"
