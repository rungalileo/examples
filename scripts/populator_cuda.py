"""populator

This helper script is used to populate example run content that new Galileo users see 
in example runs after they sign up.

To run this script, install `modal`

```bash
pip install modal-client
```

Then run the following command with the path to the notebook you want to run

```bash
modal run ./scripts/populator_cuda.py::run --notebook-path <path-to-notebook>
```
"""

from modal import Image, Mount, Secret, Stub, gpu

image = Image.from_dockerhub(
    "nvidia/cuda:11.7.1-devel-ubuntu20.04",
    setup_dockerfile_commands=[
        "RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip git python3-pip libgl1 libgl1-mesa-glx libglib2.0-0",
        "RUN ln -s /usr/bin/python3 /usr/bin/python",
        "ENV MINIMIZE_FOR_CI=false",
    ],
).pip_install_from_requirements(requirements_txt="requirements-modal-cuda.txt")
stub = Stub(
    name="populator_cuda",
    image=image,
)
secret = Secret.from_name("examples-populator-secret")


def _modalinclude(path: str) -> bool:
    return path.endswith(".ipynb") and "checkpoint" not in path


mounts = [
    Mount.from_local_dir(
        local_path="examples",
        remote_path="/root/examples",
        condition=_modalinclude,
    )
]


def _run(path: str) -> None:
    import subprocess

    cmd = f"jupyter nbconvert --debug --to notebook --execute {path}"
    subprocess.run(cmd, shell=True, check=True)


@stub.function(
    secret=secret,
    mounts=mounts,
    cpu=4,
    memory=4096,
    timeout=60 * 60 * 5,
    gpu=gpu.T4(),
)
def run(notebook_path: str) -> None:
    _run(notebook_path)
