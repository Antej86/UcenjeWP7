import 'bootstrap/dist/css/bootstrap.min.css'
import './App.css'
import NavBarBorilackiKlub from './components/NavBarBorilackiKlub'
import { Route, Routes } from 'react-router-dom'
import { RoutesNames } from './constants'
import Pocetna from './pages/Pocetna'
import TakmicenjaPregled from './pages/takmicenja/TakmicenjaPregled'
import TakmicenjaDodaj from './pages/takmicenja/TakmicenjaDodaj'
import TakmicenjaPromjena from './pages/takmicenja/TakmicenjaPromjena'


function App() {

  
  return (
    <>
      <NavBarBorilackiKlub />
      <Routes>
        <Route path={RoutesNames.HOME} element={<Pocetna />} />

        <Route path={RoutesNames.TAKMICENJE_PREGLED} element={<TakmicenjaPregled />} />
        <Route path={RoutesNames.TAKMICENJE_NOVI} element={<TakmicenjaDodaj />} />
        <Route path={RoutesNames.TAKMICENJE_PROMJENA} element={<TakmicenjaPromjena />} />
      </Routes>
    </>
  )
}

export default App
