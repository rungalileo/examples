import os
import json
import nbformat
from nbformat import v4 as nbf
import glob

def replace_quoted_strings(filename, quote_replace_dict, replace_dict):
    # Load .ipynb file
    with open(filename, 'r') as f:
        nb = nbformat.read(f, as_version=4)

    for i, cell in enumerate(nb.cells):
        if cell.cell_type == "code":
            for key, value in quote_replace_dict.items():
                # Replacing quoted strings
                cell.source = cell.source.replace(f'"{key}"', f'"{value}"')
                cell.source = cell.source.replace(f"'{key}'", f"'{value}'")
            for key, value in replace_dict.items():
                # Replacing unquoted strings
                cell.source = cell.source.replace(f'{key}', f'{value}')
            # If the cell has the following comment: (# skip ci: true)
            # replace it with an empty cell instead
            if "# skip ci: true" in cell.source:
                cell.source = ""
                cell.cell_type = "markdown"
                cell.metadata = {}
                cell.outputs = []
                cell.execution_count = None
        nb.cells[i] = cell

    # Write the updated content back to the .ipynb file
    with open(filename, 'w') as f:
        nbformat.write(nb, f)

# Dictionary with quoted strings to be replaced
quote_replace_dict = {
    "sst2": "rungalileo/sst2_tiny_subset_32",
    # add more if required
}

# Dictionary with strings to be replaced
replace_dict = {
    "num_iterations=20": "num_iterations=1",
}


# Directory with .ipynb files
files = glob.glob('**/*.ipynb', recursive=True)

# Iterate over each file in the directory
for filename in files:
    if filename.endswith(".ipynb"):
        replace_quoted_strings(filename, quote_replace_dict, replace_dict)