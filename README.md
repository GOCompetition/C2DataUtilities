# C2DataUtilities

GO Competition Challenge 2 Utility Codes.
Routines to process input and solution files for dataset checking and solution scoring

# data_utilities Python package

To make the Python modules in data_utilities/ available as a package "data_utilities", do:

    $ python -m pip install -e .

This uses the setup.py and setup.cfg files here. Then you can import from data_utilities, as in:

    from data_utilities.data import Data
    from data_utilities.evaluation import Evaluation

Also you can import the modules directly by ensuring that the data_utilities/ directory is on your Python path.

# File structure

data_utilities/
python code files

  data.py
  classes to store data for a problem instance

    read
    check
    scrub
    write

  evaluation.py
  classes to evaluate a solution to a problem instance

  infeasibility_solution.py

  cost_utils.py

  check_data.py

  scrub_data.py

  construct_infeasibility_solution.py

data/
some sample data

work.sh
workflow, including copying the data files of a scenario,
checking, scrubbing, checking again, constructing the infeasibility solution,
evaluating the infeasibility solution, doing a submission to the competition platform
with the infeasibility solver as the solver, evaluating the submission

check_data.sh

scrub_data.sh

construct_infeasibility_solution.sh

evaluate_solution.sh

do_submission.sh
duplicates the commands that are run in a submission to the competition platform
with the infeasibility solver as the solver

MyPython1.py
timed portion of the submission

MyPython2.py
loosely timed portion of the submission
