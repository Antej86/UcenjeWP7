import { Button, Container, Table } from "react-bootstrap";
import TakmicenjeService from "../../services/TakmicenjeService";
import { useEffect, useState } from "react";
import moment from "moment";
import { RoutesNames } from "../../constants";
import { Link, useNavigate } from "react-router-dom";



export default function TakmicenjaPregled(){

    const[takmicenja, setTakmicenja] = useState();

    const navigate = useNavigate();

    async function dohvatiTakmicenja() {

        // zaustavi kod u Chrome consoli i tamo se može raditi debug
        //debugger;
        
        await TakmicenjeService.get()
        .then((odgovor)=>{
            //console.log(odgovor);
            setTakmicenja(odgovor);
        })
        .catch((e)=>{console.log(e)});

    }

    useEffect(()=>{
        dohvatiTakmicenja();
    },[]);

    function formatirajDatum(datum){
        if(datum==null){
            return 'Nije definirano';
        }
        return moment.utc(datum).format('DD. MM. YYYY.');
    }

    async function obrisiAsync(sifra) {
        const odgovor = await TakmicenjeService.obrisi(sifra);
        //console.log(odgovor);
        if(odgovor.greska){
            alert(odgovor.poruka);
            return;
        }
        dohvatiTakmicenja();
    }

    function obrisi(sifra){
        obrisiAsync(sifra);
    }


    return(
        <Container>
            <Link to={RoutesNames.TAKMICENJE_NOVI}>Dodaj novo takmicenje</Link>
            <Table striped bordered hover responsive>
                <thead>
                    <tr>
                        <th>Naziv</th>
                        <th>Datum održavanja</th>
                        <th>Vrsta</th>
                        <th>Akcija</th>
                    </tr>
                </thead>
                <tbody>
                    {takmicenja && takmicenja.map((takmicenje, index)=>(
                        <tr key={index}>
                            <td>{takmicenje.naziv}</td>

                            <td className={'sredina'}>
                                {formatirajDatum(takmicenje.datumOdrzavanja)}
                            </td>

                            <td>{takmicenje.vrsta}</td>

                            <td>
                            <Button
                                variant="primary"
                                onClick={()=>navigate(`/takmicenje/${takmicenje.sifra}`)}>
                                    Promjeni
                                </Button>
                                &nbsp;&nbsp;&nbsp;
                                <Button
                                variant="danger"
                                onClick={()=>obrisi(takmicenje.sifra)}>
                                    Obriši
                                </Button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </Table>
        </Container>
    )
}