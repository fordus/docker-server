import { useState } from 'preact/hooks'
import "@fontsource/inter/700.css"
import "@fontsource/inter/800.css"

export function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div class='title'>
        <span class='logo'>JS</span>
      </div>
      <h1>Treslog</h1>
      <p>
        Docker + Java + Preact + Postgres
      </p>
    </>
  )
}
