"""populator

This helper script is used to populate example run content that new Galileo users see in example runs after they sign up.

To run this script, install `modal`

```bash
pip install modal-client
```

Then run the following command with the path to the notebook you want to run

```bash
modal run populator.py --notebook-path <path-to-notebook>
```
"""

from modal import Image, Mount, Secret, Stub, gpu

image = Image.debian_slim().pip_install_from_requirements(
    requirements_txt="requirements-ci.txt"
)
stub = Stub(
    name="populator",
    image=image,
)


def _modalinclude(path: str) -> bool:
    return path.endswith(".ipynb") and "checkpoint" not in path


@stub.function(
    secret=Secret.from_name("examples-populator-secret"),
    mounts=[
        Mount.from_local_dir(
            local_path="examples",
            remote_path="/root/examples",
            condition=_modalinclude,
        )
    ],
    cpu=4,
    memory=2048,
    timeout=60 * 60,
)
def run(notebook_path: str) -> None:
    import subprocess

    cmd = f"jupyter nbconvert --debug --to notebook --execute {notebook_path}"
    subprocess.run(cmd, shell=True)
