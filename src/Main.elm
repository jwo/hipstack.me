module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Random exposing (initialSeed, int, generate, Seed)
import String


-- model


type alias Model =
    { selectedStack : String
    , stackSelected : Bool
    , selectionButtonText : String
    , seed : Seed
    }


initModel : Model
initModel =
    { selectedStack = ""
    , stackSelected = False
    , selectionButtonText = "Select You a HipStack!"
    , seed = initialSeed 42
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


randomHipStack : Int -> String
randomHipStack i =
    let
        frontEnd =
            [ "React", "Angular 2", "Ember", "Mithril", "Elm", "VueJS" ]
                |> List.drop i
                |> List.head
                |> Maybe.withDefault ""

        mods =
            [ "Server-Less Architecture", "ImmutableJS", "ES2016 Classes", "Redux", "FalcorJS", "Isomorphic Code" ]
                |> List.drop i
                |> List.take (2)
                |> String.join " and "

        buildTool =
            [ "Gulp", "Grunt", "Ember-CLI", "Yeoman", "Webpack", "bespoke build pipeline" ]
                |> List.drop i
                |> List.head
                |> Maybe.withDefault ""

        mobile =
            [ "Xamarin", "Ionic", "Titanium", "React-Native", "Pure Android", "Native iOS" ]
                |> List.drop i
                |> List.head
                |> Maybe.withDefault ""

        api =
            [ "HAPI", "NodeJS", "Rails-API", "Elixir/Phoenix", "GO", "PHP" ]
                |> List.drop i
                |> List.head
                |> Maybe.withDefault ""

        deployedWith =
            [ "Terraform", "Capistrano", "Mina", "Chef", "Puppet", "Ansible" ]
                |> List.drop i
                |> List.head
                |> Maybe.withDefault ""

        deployedTo =
            [ "Heroku", "Amazon S3", "Amazon Lambda", "Digital Ocean", "GitHub Pages", "Surge" ]
                |> List.drop i
                |> List.head
                |> Maybe.withDefault ""
    in
        "You should build a "
            ++ frontEnd
            ++ " application with "
            ++ mods
            ++ ". Your build pipeline should be "
            ++ buildTool
            ++ ". Obvs we'll build a mobile app with "
            ++ mobile
            ++ " served by a "
            ++ api
            ++ ". And we'll totes deploy with "
            ++ deployedWith
            ++ " to "
            ++ deployedTo
            ++ ". (unless something else is new hotness by now)."


type Msg
    = SelectStack
    | NewStack Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectStack ->
            ( model, Random.generate NewStack (Random.int 0 5) )

        NewStack newFun ->
            ( { model
                | stackSelected = True
                , selectedStack = (randomHipStack newFun)
                , selectionButtonText = "Select You (another) Hipstack!"
              }
            , Cmd.none
            )



-- view


theStackClass : Model -> String
theStackClass model =
    if model.stackSelected == True then
        "the-stack"
    else
        ""


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "stack-selection" ]
            [ div [ class (theStackClass model) ] [ text model.selectedStack ]
            , button [ onClick SelectStack ] [ text model.selectionButtonText ]
            ]
        , div [ class "love" ] [ text "This app is built with love by @jwo from Sugar Land, TX with Elm and Webpack, deployed to GitHub Pages" ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never
main =
    App.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
