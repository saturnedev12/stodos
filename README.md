# **STODOS**

Stodos is a small, lightweight, high-quality utility created in Dart, for creating a to-do list in a current project folder. I was inspired by devTodo. stodos can be very useful for a developer or a team to quickly list and view tasks to do in opening other large software. stodos is free software and I will be very happy to have another contributor.

![](https://github.com/saturnedev12/stodos/raw/master/presentation/stodos.png)

- steps for compile:
    - 1 ```cd /stodos/bin```
    - 2 ```dart compile exe stodos.dart -o [ name ]```
    - 3 ```./name``` or just ```name```

# *current features*

- $```stotos``` (list all todos)
   - arguments 
        - [ ```add``` ] (insert new task)
        - [ ```update [index]``` ] (update a task with is index)
        - [ ```remove [index]``` ] (remove a task with is index)
        - **index 0 dont allowed**
- after **add** you can choice task level
    - 0 for regular
    - 1 for medium
    - 2 for important

