module Components.TodoList exposing (..)

import Html exposing (text, Html, div, a, ul, li, span, button)
import Html.Attributes exposing (class, href)
import Models.Todo
import Messages.TodoMsg exposing (Msg)
import Components.Details


view : Models.Todo.TodoList -> Html Msg
view todoList =
    div [ class "list" ]
        [ ul [] (List.map Components.Details.view todoList.todos)
        ]
