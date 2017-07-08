module App exposing (..)

import Html exposing (Html, div, text, program, a)
import Models.Todo exposing (Todo, TodoList)
import Messages.TodoMsg exposing (Msg)
import Components.TodoList 
import Components.NewTodo
import List.Extra

type alias Model = {
    editingContent: String, 
    editingTodoId: Int,
    todoList: TodoList
}

initialTodoList : TodoList 
initialTodoList = 
    { todos= [{id=1, content="test", completed=False}] }

initialModel : Model
initialModel = 
    { editingContent = "", editingTodoId = -1, todoList = initialTodoList }

-- MODEL
init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )

-- VIEW


view : Model -> Html Msg
view model =
    div [] [
      Components.TodoList.view model.todoList,
      Components.NewTodo.view model.editingContent
    ]

-- UPDATE

type alias RecordWithID a =
    { a | id : Int }

maxId : List (RecordWithID a) -> Int
maxId list =
    list |> List.map (.id) |> List.maximum |> Maybe.withDefault -1

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.TodoMsg.EditContent content-> 
            ({model | editingContent = content}, Cmd.none)

        Messages.TodoMsg.AddTodo ->
            (
                {
                    todoList = {todos = {id=(maxId model.todoList.todos) + 1, content=model.editingContent, completed= False} :: model.todoList.todos},
                    editingContent="",
                    editingTodoId=-1
                }, 
                Cmd.none
            ) 

        Messages.TodoMsg.DeleteTodo id ->
            (model, Cmd.none)

        Messages.TodoMsg.ToggleTodo id ->
            (model, Cmd.none)



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