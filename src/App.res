%%raw(`import './App.css';`)
@module("./logo.svg") external logo: string = "default"

type todo = {
  title: string,
  isComplete: bool,
}

// state has a list of todos and an inputValue, which serves as the user input
type state = {todoList: array<todo>, inputValue: string}

let initialState: state = {
  todoList: [],
  inputValue: "",
}

// All possible actions: AddTodo will give us a todo item; InputChanged will expect a string
type actions = AddTodo | ClearTodos | InputChanged(string)

let reducer = (state, action) => {
  switch action {
  | AddTodo => {
      inputValue: "",
      todoList: state.todoList->Js.Array2.concat([
        {
          title: state.inputValue,
          isComplete: false,
        },
      ]),
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
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let handleInput = e => {
    let newInput = ReactEvent.Form.target(e)["value"]
    newInput->InputChanged->dispatch
  }

  <div className="App">
    <h1> {"Todo List"->React.string} </h1>
    {state.inputValue->React.string}
    <input value={state.inputValue} type_="text" onChange={handleInput} />
    <button onClick={_ => dispatch(AddTodo)}> {"Add"->React.string} </button>
    {state.todoList
    ->Belt.Array.map(todo => {
      <div> {todo.title->React.string} </div>
    })
    ->React.array}
  </div>
}
