module Messages.TodoMsg exposing (..)

type Msg
    = AddTodo 
    | DeleteTodo Int
    | ToggleTodo Int
    | EditContent String