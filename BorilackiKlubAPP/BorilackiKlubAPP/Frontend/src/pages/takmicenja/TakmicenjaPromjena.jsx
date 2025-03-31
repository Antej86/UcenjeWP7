import { Button, Col, Container, Form, Row } from "react-bootstrap";
import { Link, useNavigate, useParams } from "react-router-dom";
import { RoutesNames } from "../../constants";
import moment from "moment";
import TakmicenjeService from "../../services/TakmicenjeService";
import { useEffect, useState } from "react";



export default function TakmicenjaPromjena(){

    const navigate = useNavigate();
    const routeParams = useParams();
    const [takmicenje, setTakmicenje] = useState({});

    async function dohvatiTakmicenje(){
        const odgovor = await TakmicenjeService.getBySifra(routeParams.sifra);
        if(odgovor.greska){
            alert(odgovor.poruka);
            return;
        }
        odgovor.poruka.datumOdrzavanja = moment.utc(odgovor.poruka.datumOdrzavanja).format('yyyy-MM-DD');
        setTakmicenje(odgovor.poruka);
    }

    useEffect(()=>{
        dohvatiTakmicenje();
    }, []);

    async function promjena(takmicenje){
        //console.log(takmicenje);
        //console.log(JSON.stringify(takmicenje));
        const odgovor = await TakmicenjeService.promjena(routeParams.sifra,takmicenje);
        if(odgovor.greska){
            alert(odgovor.poruka);
            return;
        }
        navigate(RoutesNames.TAKMICENJE_PREGLED);
    }

    function obradiSubmit(e){ // e predstavlja event
        e.preventDefault();

        const podaci = new FormData(e.target);

        promjena({
            naziv: podaci.get('naziv'),
            datumOdrzavanja: moment.utc(podaci.get('datumOdrzavanja')),
            vrsta: podaci.get('vrsta'),
        });

    }

    return(
        <Container>
            Promjena takmicenja
            
            <Form onSubmit={obradiSubmit}>
                <Form.Group controlId="naziv">
                    <Form.Label>Naziv</Form.Label>
                    <Form.Control type="text" name="naziv" required 
                    defaultValue={takmicenje.naziv} />
                </Form.Group>

                <Form.Group controlId="datumOdrzavanja">
                    <Form.Label>Datum održavanja</Form.Label>
                    <Form.Control type="date" name="datumOdrzavanja"  
                    defaultValue={takmicenje.datumOdrzavanja}/>
                </Form.Group>

                <Form.Group controlId="vrsta">
                    <Form.Label>Vrsta</Form.Label>
                    <Form.Control type="text" name="vrsta" required 
                    defaultValue={takmicenje.vrsta} />
                </Form.Group>

                <hr />
                <Row>
                    <Col xs={6} sm={6} md={3} lg={6} xl={6} xxl={6}>
                    <Link to={RoutesNames.TAKMICENJE_PREGLED}
                    className="btn btn-danger siroko">
                    Odustani
                    </Link>
                    </Col>
                    <Col xs={6} sm={6} md={9} lg={6} xl={6} xxl={6}>
                    <Button variant="primary" type="submit" className="siroko">
                        Promjeni takmicenje
                    </Button>
                    </Col>
                </Row>
            </Form>
        </Container>
    )
}