module Components.Details exposing (view)

import Html exposing (text, Html, div, a, ul, li, span, button)
import Html.Attributes exposing (class, href)
import Models.Todo
import Messages.TodoMsg exposing (Msg)
import Html.Events exposing (onClick, onInput)


view : Models.Todo.Todo -> Html Msg
view model =
    li []
        [ button [ onClick (Messages.TodoMsg.ToggleTodo model.id) ] [ text "Toggle" ]
        , button [ onClick (Messages.TodoMsg.DeleteTodo model.id) ] [ text "Delete" ]
        , span [] [ text "Id:" ]
        , span [] [ text (toString model.id) ]
        , a [ href "www.google.com" ] [ text model.content ]
        , span [] [ text ". Completed:" ]
        , span [] [ text (toString model.completed) ]
        ]
