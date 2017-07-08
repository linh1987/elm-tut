module Models.Todo exposing (..)

type alias Todo =
  { id: Int, content: String, completed: Bool }

  
type alias TodoList = 
    {todos: List Todo}