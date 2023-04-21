# rescript-to-do

Steps

Install template with command `npx create-react-app . --template rescript-app`
Run `npm run re:start` to compile rescript to javascript. This gives us the `index.bs.js` and `App.bs.js` files 

When creating our reducers, something I found out was that spreading arrays is not supported in ReScript.

For example, if we wanted to add an item to the todo list in JavaScript we would have

```js
todoList: [...state.todoList, todo]
```

whereas in ReScript we have to use a concat function instead

```rescript
todoList: state.todoList->Js.Array2.concat([todo])
```
