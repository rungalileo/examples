import os
import json
import nbformat
from nbformat import v4 as nbf
import glob

def replace_quoted_strings(filename, replace_dict):
    # Load .ipynb file
    with open(filename, 'r') as f:
        nb = nbformat.read(f, as_version=4)

    for i, cell in enumerate(nb.cells):
        if cell.cell_type == "code":
            for key, value in replace_dict.items():
                # Replacing quoted strings
                cell.source = cell.source.replace(f'"{key}"', f'"{value}"')
                cell.source = cell.source.replace(f"'{key}'", f"'{value}'")

        nb.cells[i] = cell

    # Write the updated content back to the .ipynb file
    with open(filename, 'w') as f:
        nbformat.write(nb, f)

# Dictionary with strings to be replaced
replace_dict = {
    "sst2": "rungalileo/sst2_tiny_subset_32",
    # add more if required
}

# Directory with .ipynb files
files = glob.glob('**/*.ipynb', recursive=True)

# Iterate over each file in the directory
for filename in files:
    if filename.endswith(".ipynb"):
        replace_quoted_strings(os.path.join(dir_path, filename), replace_dict)