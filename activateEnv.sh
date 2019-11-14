# deactivate any curent environment
deactivate
# source the virtual environment
venvSource="$venv/bin/activate"
printf "activating vertial environment in $venvSource;\ntype 'deactivate' to leave virtual environment\n"
source ./$venvSource
