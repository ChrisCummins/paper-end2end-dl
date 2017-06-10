## 1. Requirements

* Ubuntu Linux (we recommend 16.04).
* Python 3.6.
* libhdf5.

For your convenience, we provide a script `./bootstrap.sh` to automate the
installation of these requirements on Ubuntu Linux. The script will print
installation commands for any missing requirements. Install these automatically
using:

```sh
$ ./bootstrap.sh | bash
```

Additionally, we recommend the use of CUDA on an NVIDIA GPU to speed up TensorFlow experiments. Installation instructions are available [here](https://www.tensorflow.org/install/install_linux#nvidia_requirements_to_run_tensorflow_with_gpu_support).

## 2. Installation

```sh
$ ./configure
... # answer yes/no prompts
$ make
```

This does not require sudo privileges. The only directory modified outside of this repository is `~/.ipython/kernels`.

## 3. Running the Code

The executable code is in the form of [Jupyter](https://jupyter.readthedocs.io/en/latest/index.html) notebooks. Launch the Jupter server using:

```sh
$ make run
```

*Note:* If you wish to run the Jupyter server on a remote machine (for example,
you are working on a server over SSH), you will need to configure the Jupyter
server for public access. See the
[official documentation](https://jupyter-notebook.readthedocs.io/en/latest/public_server.html#running-a-public-notebook-server)
for instructions.

#### 3.1. Experiments

The following notebooks are available:

1. **[Language Model.ipynb](Language%20Model.ipynb)** - demonstrates the transforming and encoding of OpenCL source code for machine learning.
2. **[Case Study A.ipynb](Case%20Study%20A.ipynb)** - code for the Heterogeneous Mapping experiments in the paper.
3. TODO: **Case Study B.ipynb** - code for the OpenCL Thread Coarsening experiments in the paper.

#### 3.2. Data caching

Many of the experiments are long running and computationally expensive. Run times can range from hours to days, depending on hardware. To amortize these costs, expensive experimental data is cached for re-use upon production. If you would like to remove any cached data, run:

```sh
$ make -C ../data refresh
...
```

#### 3.3. Headless execution

Running long running experiments in Jupyter Notebooks can be a hassle, as any loss of connection to the notebook may halt execution. Because of this, we provide a headless execution mode, which converts the Jupyter Notebooks into standalone Python scripts. These scripts will produce the cached data which can be viewed from the Jupyter Notebooks. To use this headless execution mode, run:

```sh
$ make run-batch
```

#### 3.4. Using our cached data

In addition to the code necessary to re-produce our experiments, we also supply the actual experimental results we used for the paper, as obtained from our hardware. To unpack our cached data, run:

```sh
$ make -C ../data all
...
```

Note that this replaces any cached data you may have produced.

## 4. Uninstallation

```sh
$ make clean
```

This does not require sudo privileges. The only directory modified outside of this repository is `~/.ipython/kernels`.
