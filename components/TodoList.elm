module Components.TodoList exposing (..)
import Html exposing (text, Html, div, a, ul, li, span)
import Html.Attributes exposing (class, href)
import Models.Todo
import Messages.TodoMsg exposing (Msg)


todo : Models.Todo.Todo -> Html msg
todo model = 
    li [] [
      span [][text "Id:"], 
      span [][text (toString model.id)],
      a [href "www.google.com"] [text model.content]
      ]


view : Models.Todo.TodoList -> Html Msg
view todoList =
  div [class "list"] [
      ul [] (List.map todo todoList.todos)
  ]