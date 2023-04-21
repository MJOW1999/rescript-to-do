%%raw(`import './App.css';`)
@module("./logo.svg") external logo: string = "default"

type todo = {
  title: string,
  description: string,
}

// state has a list of todos and an inputValue, which serves as the user input
type state = {todoList: array<todo>, inputValue: string}

let initialState: state = {
  todoList: [],
  inputValue: "",
}

// All possible actions: AddTodo will give us a todo item; InputChanged will expect a string
type actions = AddTodo(todo) | ClearTodos | InputChanged(string)

let reducer = (state, action) => {
  switch action {
  | AddTodo(todo) => {
      inputValue: "",
      todoList: state.todoList->Js.Array2.concat([todo]),
    }
  | ClearTodos => {
      ...state,
      todoList: [],
    }
  | InputChanged(newInput) => {
      ...state,
      inputValue: newInput,
    }
  }
}

@react.component
let make = () => {
  <div className="App"> <h1> {"Hello World"->React.string} </h1> </div>
}
