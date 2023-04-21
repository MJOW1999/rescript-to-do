# rescript-to-do

## Process

### Installation

Install template with command `npx create-react-app . --template rescript-app`

Run `npm run re:start` to compile rescript to javascript. This gives us the `index.bs.js` and `App.bs.js` files.

Add the ReScript extension in Visual Studio

### Reducers

When creating our reducers, something I found out was that spreading arrays is not supported in ReScript.

For example, if we wanted to add an item to the todo list in JavaScript we would have

```js
todoList: [...state.todoList, todo]
```

whereas in ReScript we have to use a concat function instead

```rescript
todoList: state.todoList->Js.Array2.concat([todo])
```

### Display content

**Note**: `type` is a reserved word in ReScript, use `type_` instead

When handling events the syntax is slightly different in ReScript

Instead of 

```js
const handleInput = (e) => {
    e.target.value = // handleInput
}
```
we would have

```rescript
let handleInput = (e) => {
    let newInput = ReactEvent.Form.target(e)["value"]
}
```

There are multiple ways to dispatch an action in ReScript

1. A method which is good for function composition

```rescript
dispatch(InputChanged(newInput))
```

2. If you want to work from the inside-out, then this method is preferable (pipe operator)
```rescript
    newInput->InputChanged->dispatch
```

When displaying the todo list we have to map through the array items and then convert it into a React array.
We use [Belt](https://rescript-lang.org/docs/manual/latest/api/belt) to make this immutable

```rescript
{state.todoList -> Belt.Array.map((todo) => {
      <div>
        {todo.title->React.string}
      </div>
    })
    -> React.array}
```