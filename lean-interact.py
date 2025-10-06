#%%
from lean_interact import LeanREPLConfig, TempRequireProject, LeanRequire, LeanServer, FileCommand, Command
from pathlib import Path
import re
# Create a temporary project with Mathlib as a dependency
project = TempRequireProject(
    lean_version="v4.23.0",
    require=[
        LeanRequire(
            name="mathlib",
            git="https://github.com/leanprover-community/mathlib4.git",
            rev="v4.23.0"
        )
    ]
)
config = LeanREPLConfig(project=project)

class eval:
    def __init__(self, path):
        server = LeanServer(config)
        self.path = Path(path).resolve()

        response = server.run(FileCommand(path=str(self.path)))
        self.response = response
print(eval("hw1.lean").response)
#%% 