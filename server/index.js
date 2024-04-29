const express=require('express');
const mysql=require('mysql');
const cors=require('cors');
const mail=require('nodemailer');

const app=express();
app.use(cors())
app.use(express.json());

const con=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"Vignesh13",
    database:"places_diseases",
    port:3310
})

con.connect(function (err){
    if(err) throw err;
    console.log("connection success");
})

const transport=mail.createTransport({
    service:'gmail',
    auth:{
        user:'b.n.vignesh2020@gmail.com',
        pass:'kvln ykjh zsyk wvui'
    }
})

app.get('/:name',(req,res)=>{
    const name=req.params.name
    console.log(name);
    const query=`select * from disease_table where name=?`;
    con.query(query,[name],(err,data)=>{
        if(err) return err;
        console.log (data);
        return res.json(data);
    })
})
app.get('/city/:name',(req,res)=>{
    const name=req.params.name;
    console.log(name);
    const query=`select * from city_table join outbreak on city_table.city_id=outbreak.city_id where name=?`;
    con.query(query,[name],(err,data)=>{
        if(err) return err;
        console.log(data);
        return res.json(data);
    })
})

app.get('/symptom/:dname',(req,res)=>{
    const name=req.params.dname;
    console.log(name);
    const query=`select * from symptoms_table join disease_table on symptoms_table.disease_id=disease_table.disease_id where name=?`
    con.query(query,[name],(err,data)=>{
        if(err) return err;
        console.log(data);
        return res.json(data);
    })
})
   
app.post ('/contact',(req,res)=>{
    const values=[req.body.email,req.body.message];
    const query=`insert into queries (email,message) values (?,?)`;
    console.log(values);
    //mail
    const info={
        from:'b.n.vignesh2020@gmail.com',
        to:'allietheanonymousfriend@gmail.com',
        subject:`from ${req.body.email}`,
        text:`${req.body.message}`
    }
    transport.sendMail(info,(err,res)=>{
        if(err){console.log(err)}
        else{console.log('mail sent');}
    })
    //sql
    con.query(query,values,(err,data)=>{
        if(err) return res.json({err});
        return res.json({status:'success'});
    })
})
app.listen(8088);