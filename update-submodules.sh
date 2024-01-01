# initialize submodules if not already done
git submodule update --init

# Loop through all submodules
git submodule foreach '(
  # Get the current branch for the submodule
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || echo "HEAD")

  # Update the submodule to the latest commit on its current branch
  git pull origin $branch
)'

