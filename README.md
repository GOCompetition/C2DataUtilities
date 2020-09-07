# C2DataUtilities
GO Competition Challenge 2 Utility Codes.
Routines to process input and solution files for dataset checking and solution scoring

py/
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
(essentially) untimed portion of the submission
