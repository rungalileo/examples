import subprocess
import sys

subprocess.check_call([sys.executable, "-m", "pip", "install", "dataquality"])

print("HELLO WORLD")
