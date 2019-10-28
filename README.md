### Screenshot
![Image](https://raw.githubusercontent.com/sumanp/todo/master/tmp/screenshot.png)

## Specification
1. Built with RoR 6.0 & Ruby 2.6.3
2. rbenv install 2.6.3
3. gem install rails -v 6.0
4. rake db:setup, rake db:migrate
5. rails s or foreman start -f procfile.dev


### Requirement
1. Authenticate user
2. Once logged in, user should be able to see
a. All his tasks that are not marked as complete. (Add filter)
b. All his tasks that are due for that day.
3. User should be able to create a new task for his To-do list.
4. Each task has a title and a description and a due date.
5. User should be able to edit a task’s title, description, change the due date and mark the
task as complete.
6. Able to rearrange the task
7. logout

### Improvements that can be done
1. Tick task from the task list (ajax call)
2. Better UI
3. Client side validation for title
4. Better date picker with local client time
