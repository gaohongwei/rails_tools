
Run rake tasks from within Rake tasks

This always executes the task, but it doesn't execute its dependencies:
Rake::Task["build"].execute

This one executes the dependencies, but it only executes the task if it has not already been invoked:
Rake::Task["build"].invoke

This first resets the task's already_invoked state, allowing the task to then be executed again, dependencies and all:
Rake::Task["build"].reenable
Rake::Task["build"].invoke
