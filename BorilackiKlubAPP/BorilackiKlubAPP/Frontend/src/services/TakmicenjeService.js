import { HttpService } from "./HttpService"


async function get(){
    return await HttpService.get('/Takmicenje')
    .then((odgovor)=>{
        //console.table(odgovor.data);
        return odgovor.data;
    })
    .catch((e)=>{console.error(e)})
}

async function getBySifra(sifra){
    return await HttpService.get('/Takmicenje/' + sifra)
    .then((odgovor)=>{
        return {greska: false, poruka: odgovor.data}
    })
    .catch((e)=>{
        return {greska: true, poruka: 'Ne postoji takmicenje!'}
    })
}

async function obrisi(sifra) {
    return await HttpService.delete('/Takmicenje/' + sifra)
    .then((odgovor)=>{
        //console.log(odgovor);
       return odgovor;
    })
    .catch((e)=>{
        //console.log(e);
        return {greska: true, poruka: 'Takmicenje se ne može obrisati!'}
    })
}

async function dodaj(takmicenje) {
    return await HttpService.post('/Takmicenje', takmicenje)
    .then((odgovor)=>{
        return {greska: false, poruka: odgovor.data}
    })
    .catch((e)=>{
        return {greska: true, poruka: 'Takmicenje se ne može dodati!'}
    })
}

async function promjena(sifra, takmicenje) {
    return await HttpService.put('/Takmicenje/' + sifra, takmicenje)
    .then((odgovor)=>{
        return {greska: false, poruka: odgovor.data}
    })
    .catch((e)=>{
        return {greska: true, poruka: 'Takmicenje se ne može promjeniti!'}
    })
}

export default{
    get,
    getBySifra,
    obrisi,
    dodaj,
    promjena
}