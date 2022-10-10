# Installations

## iterm2

- Follow the steps on [here](https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c)

## Mini-conda & jupyter notebooks

- Donwload [here](https://docs.conda.io/en/latest/miniconda.html)

- If you're using zsh, run:

```bash
conda init zsh
```

- If you're not using zsh, check conda commands are understood by typing:

```bash
conda --version
```

If you DON'T get the message "conda command not found", then great!

### Jupyter notebook (from terminal)

```bash
conda install -c anaconda jupyter
```

### Setting everything up

```bash
conda create-y --name ironhack
conda activate -yironhack
conda install -y -c anaconda ipykernel
python -m ipykernel install --user --name=ironhack
conda install -y -c conda-forge jupyter_contrib_nbextensions
```
