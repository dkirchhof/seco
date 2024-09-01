// // external p: promise<Jsx.element> => Jsx.element = "%identity"

// type props = {initialValue: int}

// let make = async props => {
//   <button> {JSX.int(props.initialValue)} </button>
// }

// // let make = props => props->make->p

// module X = {
//   @jsx.component
//   let make = async (~initialValue) => {
//     <button> {JSX.int(initialValue)} </button>
//   }
// }
