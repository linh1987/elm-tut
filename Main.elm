module App exposing (..)

import Html exposing (Html, div, text, program, a)
import Models.Todo exposing (Todo, TodoList)
import Messages.TodoMsg exposing (Msg)
import Components.TodoList
import Components.NewTodo
import Utilities.List exposing (maxId)


type alias Model =
    { editingContent : String
    , editingTodoId : Int
    , todoList : TodoList
    }


initialModel : Model
initialModel =
    { editingContent = "", editingTodoId = -1, todoList = { todos = [] } }



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Components.TodoList.view model.todoList
        , Components.NewTodo.view model.editingContent
        ]


toggleTodo : Int -> Todo -> Todo
toggleTodo id todo =
    { todo
        | completed =
            if todo.id == id then
                not (todo.completed)
            else
                todo.completed
    }



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.TodoMsg.EditContent content ->
            ( { model | editingContent = content }, Cmd.none )

        Messages.TodoMsg.AddTodo ->
            let
                todoList =
                    model.todoList
            in
                if (model.editingContent /= "") then
                    ( { model
                        | todoList =
                            { todoList
                                | todos = todoList.todos ++ [ Models.Todo.makeTodo model.editingContent ((maxId model.todoList.todos) + 1) False ]
                            }
                        , editingContent = ""
                        , editingTodoId = -1
                      }
                    , Cmd.none
                    )
                else
                    ( model, Cmd.none )

        Messages.TodoMsg.DeleteTodo id ->
            let
                todoList =
                    model.todoList
            in
                ( { model
                    | todoList =
                        { todoList
                            | todos = List.filter (\todo -> not (todo.id == id)) todoList.todos
                        }
                  }
                , Cmd.none
                )

        Messages.TodoMsg.ToggleTodo id ->
            let
                todoList =
                    model.todoList
            in
                ( { model
                    | todoList =
                        { todoList
                            | todos = List.map (toggleTodo id) todoList.todos
                        }
                  }
                , Cmd.none
                )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
