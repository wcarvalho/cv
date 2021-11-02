conda create --name cv

eval "$(conda shell.bash hook)"

conda activate cv

conda install pip
pip install -r requirements.txt