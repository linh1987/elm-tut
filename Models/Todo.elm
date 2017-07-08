module Models.Todo exposing (..)


type alias Todo =
    { id : Int, content : String, completed : Bool }


type alias TodoList =
    { todos : List Todo }


makeTodo : String -> Int -> Bool -> Todo
makeTodo content id completed =
    { id = id, content = content, completed = completed }
