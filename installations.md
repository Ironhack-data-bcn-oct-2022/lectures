# Installations

First, go to anaconda and delete your ironhack environment. We will re-create later through miniconda.

## iterm2

- Follow the steps on [here](https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c)

## Mini-conda & jupyter notebooks

- Donwload [here](https://docs.conda.io/en/latest/miniconda.html)

#### Setting everything up

```bash
# Linkin miniconda with your terminal

conda init zsh #mac
conda init bash #windows

# Create environment
conda create -y -n ironhack
conda activate -y ironhack

# Install jupyter notebooks
conda install -y -c anaconda jupyter

# Installing kernel
conda install -y -c anaconda ipykernel
python -m ipykernel install --user --name=ironhack

# Exrensions
conda install -y -c conda-forge jupyter_contrib_nbextensions
```

- Kill and reopen terminal. Try:

```bash
# On one window
conda activate ironhack
jupyter notebooks
```

```bash
# On a second, new window
conda activate ironhack
```
